@extends('layouts.app')

@section('content')
<div class="container">
    <h3>Daftar Pejabat</h3>
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    <a href="{{ route('employees.create') }}" class="btn btn-primary mb-3">+ Tambah Pejabat</a>
    <table class="table table-bordered table-striped">
        <thead class="thead-light">
            <tr>
                <th>Foto</th>
                <th>Nama</th>
                <th>Jabatan</th>
                <th>Kategori</th>
                <th>Dibuat</th>
                <th style="min-width: 130px">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($employees as $emp)
            <tr>
                <td>@if($emp->photo)<img src="{{ asset('uploads') }}/{{ $emp->photo }}" width="60">@endif</td>
                <td>{{ $emp->name }}</td>
                <td>{{ $emp->position }}</td>
                <td>{{ $emp->category }}</td>
                <td>{{ $emp->created_at }}</td>
                <td>
                    <a href="{{ route('employees.edit', $emp->id) }}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="{{ route('employees.destroy', $emp->id) }}" method="POST" style="display:inline;">
                        @csrf @method('DELETE')
                        <button class="btn btn-sm btn-danger" onclick="return confirm('Yakin hapus?')">Hapus</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr><td colspan="6" class="text-center">Belum ada Pejabat</td></tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
