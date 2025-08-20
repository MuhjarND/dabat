<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class EmployeeController extends Controller
{
    private $categories = [
            'Pimpinan',
            'Hakim Tinggi',
            'Sekretaris dan Panitera',
            'Kepala Bagian',
            'Panitera Muda',
            'Kepala Sub Bagian',
            'Panitera Pengganti'
    ];

    public function index()
    {
        $employees = DB::table('employees')
            ->orderByRaw("FIELD(
            employees.category,
            'Pimpinan',
            'Hakim Tinggi',
            'Sekretaris dan Panitera',
            'Kepala Bagian',
            'Panitera Muda',
            'Kepala Sub Bagian',
            'Panitera Pengganti'
        )")
            ->orderBy('name')
            ->get();
        return view('employees.index', compact('employees'));
    }

    public function create()
    {
        $categories = $this->categories;
        return view('employees.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'     => 'required|string|max:255',
            'position' => 'nullable|string|max:255',
            'category' => 'required|in:Pimpinan,Hakim Tinggi,Sekretaris dan Panitera,Kepala Bagian,Panitera Muda,Kepala Sub Bagian,Panitera Pengganti',
            'photo'    => 'nullable|image|max:2048',
        ]);

        $photoPath = $request->file('photo') ? $request->file('photo')->store('photos', 'public') : null;

        $employeeId = DB::table('employees')->insertGetId([
            'name'       => $request->name,
            'position'   => $request->position,
            'category'   => $request->category,
            'photo'      => $photoPath,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('employee_statuses')->insert([
            'employee_id' => $employeeId,
            'status'      => 'tidak_ada',
            'created_at'  => now(),
            'updated_at'  => now()
        ]);

        return redirect()->route('employees.index')->with('success', 'Pegawai berhasil ditambahkan');
    }

    public function edit($id)
    {
        $employee = DB::table('employees')->where('id', $id)->first();
        abort_if(!$employee, 404);
        $categories = $this->categories;
        return view('employees.edit', compact('employee','categories'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name'     => 'required|string|max:255',
            'position' => 'nullable|string|max:255',
            'category' => 'required|in:Pimpinan,Hakim Tinggi,Sekretaris dan Panitera,Kepala Bagian,Panitera Muda,Kepala Sub Bagian,Panitera Pengganti',
            'photo'    => 'nullable|image|max:2048',
        ]);

        $employee = DB::table('employees')->where('id', $id)->first();
        abort_if(!$employee, 404);

        $photoPath = $employee->photo;

        if ($request->file('photo')) {
            if ($employee->photo) {
                Storage::disk('public')->delete($employee->photo);
            }
            $photoPath = $request->file('photo')->store('photos', 'public');
        }

        DB::table('employees')->where('id', $id)->update([
            'name'       => $request->name,
            'position'   => $request->position,
            'category'   => $request->category,
            'photo'      => $photoPath,
            'updated_at' => now()
        ]);

        return redirect()->route('employees.index')->with('success', 'Pegawai berhasil diperbarui');
    }

    public function destroy($id)
    {
        $employee = DB::table('employees')->where('id', $id)->first();
        abort_if(!$employee, 404);

        if ($employee->photo) {
            Storage::disk('public')->delete($employee->photo);
        }

        DB::table('employee_statuses')->where('employee_id', $id)->delete();
        DB::table('employees')->where('id', $id)->delete();

        return redirect()->route('employees.index')->with('success', 'Pegawai berhasil dihapus');
    }
}
