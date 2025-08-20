<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Daftar Pejabat PTA Pabar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}" >
</head>
<body>
<div class="d-flex" style="min-height: 100vh;">
  <!-- Sidebar -->
  <nav class="bg-dark text-white p-3" style="width: 250px;">
    <h4 class="text-white d-flex align-items-center">
    <img src="{{ asset('images/logo.png') }}" alt="Logo" width="30" class="mr-2">
    Kehadiran Pejabat
    </h4>
    <ul class="nav flex-column mt-4">
        <li class="nav-item mb-2">
            <a href="{{ route('dashboard') }}"
            class="nav-link text-white {{ request()->is('dashboard') ? 'active font-weight-bold bg-secondary rounded' : '' }}">
                <i class="bi bi-speedometer2 mr-2"></i> Dashboard
            </a>
        </li>

        <li class="nav-item mb-2">
            <a href="{{ route('employees.index') }}"
            class="nav-link text-white {{ request()->is('employees*') ? 'active font-weight-bold bg-secondary rounded' : '' }}">
                <i class="bi bi-people-fill mr-2"></i> Kelola Data Pejabat
            </a>
        </li>
      <li class="nav-item mt-4">
        <a href="{{ route('logout') }}" class="btn btn-sm btn-outline-light"
           onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
          Logout
        </a>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
          @csrf
        </form>
      </li>
    </ul>
  </nav>

  <!-- Konten Utama -->
  <div class="flex-grow-1 p-4">
    @yield('content')
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
@stack('scripts')
</body>
</html>
