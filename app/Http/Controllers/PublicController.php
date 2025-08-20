<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PublicController extends Controller
{
    public function index()
    {
        return view('public');
    }

    public function json()
    {
        $data = DB::table('employees')
            ->join('employee_statuses', 'employees.id', '=', 'employee_statuses.employee_id')
            ->select('employees.id', 'employees.name', 'employees.position', 'employees.category', 'employees.photo', 'employee_statuses.status')
            ->orderByRaw("FIELD(employees.category, 'Pimpinan', 'HakimTinggi', 'Kesekretariatan', 'Kepaniteraan')")
            ->orderBy('employees.created_at')
            ->get();

        return response()->json($data);
    }
}
