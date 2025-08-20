<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OperatorController extends Controller
{
    public function index()
    {
        $employees = DB::table('employees')
            ->join('employee_statuses', 'employees.id', '=', 'employee_statuses.employee_id')
            ->select('employees.*', 'employee_statuses.status')
                ->orderByRaw("FIELD(employees.category,
                    'Pimpinan',
                    'Hakim Tinggi',
                    'Sekretaris dan Panitera',
                    'Kepala Bagian',
                    'Panitera Muda',
                    'Kepala Sub Bagian',
                    'Panitera Pengganti'
                    )")
            ->orderBy('employees.name')
            ->get();

        return view('dashboard', compact('employees'));
    }

    public function updateStatus(Request $request)
    {
        $request->validate([
            'employee_id' => 'required|integer|exists:employees,id',
            'status'      => 'required|in:ada,tidak_ada',
        ]);

        DB::table('employee_statuses')->updateOrInsert(
            ['employee_id' => $request->employee_id],
            ['status' => $request->status, 'updated_at' => now()]
        );

        return response()->json(['success' => true]);
    }
}
