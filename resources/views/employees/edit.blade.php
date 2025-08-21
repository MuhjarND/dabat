@extends('layouts.app')

@section('content')
<div class="container">
    <h3>Edit Pejabat</h3>
    <form action="{{ route('employees.update', $employee->id) }}" method="POST" enctype="multipart/form-data">
        @csrf @method('PUT')
        <div class="form-group">
            <label>Nama <span class="text-danger">*</span></label>
            <input type="text" name="name" class="form-control" value="{{ old('name', $employee->name) }}" required>
            @error('name') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <div class="form-group">
            <label>Jabatan</label>
            <input type="text" name="position" class="form-control" value="{{ old('position', $employee->position) }}">
            @error('position') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <div class="form-group">
            <label>Kategori Jabatan <span class="text-danger">*</span></label>
            <select name="category" class="form-control" required>
                <option value="Pimpinan"        {{ $employee->category=='Pimpinan' ? 'selected' : '' }}>Pimpinan</option>
                <option value="Hakim Tinggi"    {{ $employee->category=='Hakim Tinggi' ? 'selected' : '' }}>Hakim Tinggi</option>
                <option value="Sekretaris dan Panitera" {{ $employee->category=='Sekretaris dan Panitera' ? 'selected' : '' }}>Sekretaris dan Panitera</option>
                <option value="Kepala Bagian" {{ $employee->category=='Kepala Bagian' ? 'selected' : '' }}>Kepala Bagian</option>
                <option value="Panitera Muda" {{ $employee->category=='Panitera Muda' ? 'selected' : '' }}>Panitera Muda</option>
                <option value="Kepala Sub Bagian" {{ $employee->category=='Kepala Sub Bagian' ? 'selected' : '' }}>Kepala Sub Bagian</option>
                <option value="Panitera Pengganti" {{ $employee->category=='Panitera Pengganti' ? 'selected' : '' }}>Panitera Pengganti</option>
            </select>
            @error('category') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <div class="form-group">
            <label>Foto (biarkan kosong jika tidak diubah)</label>
            <input type="file" name="photo" class="form-control-file">
            @if($employee->photo)
                <br><img src="{{ asset('uploads') }}/{{ $employee->photo }}" width="100">
            @endif
            @error('photo') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <button class="btn btn-success">Update</button>
        <a href="{{ route('employees.index') }}" class="btn btn-secondary">Batal</a>
    </form>
</div>
@endsection
