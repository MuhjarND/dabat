<!DOCTYPE html>
<html>
<head>
    <title>Daftar Kehadiran Pejabat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        body {
            background: #f4f6f9;
            scroll-behavior: smooth;
            padding-top: 70px; /* header fixed */
        }

        /* Card tanpa animasi */
        .status-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card-img-top {
            height: 250px;
            object-fit: cover;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        /* Header instansi */
        .instansi-header {
            position: fixed;
            top: 0; left: 0; width: 100%;
            background-color: #004080;
            color: white;
            padding: 10px 0;
            text-align: center;
            z-index: 1000;
        }
        .instansi-header img { height: 50px; margin-right: 15px; }
        .instansi-title { font-size: 1.5rem; font-weight: bold; margin: 0; text-transform: uppercase; }
        .instansi-title2 { font-size: 1.1rem; font-weight: bold; margin: 0; text-transform: uppercase; }

        /* Logo pojok */
        .logo-kiri, .logo-kanan { position: fixed; top: 15px; z-index: 999; }
        .logo-kiri { left: 10px; }
        .logo-kanan { right: 10px; }

        .category-title { margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700; }
        #tanggal { font-size: 1rem; margin-top: 5px; font-weight: 400; }

        /* Badge status */
        .badge-status {
            font-weight: 700;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 1rem;
            display: inline-block;
            letter-spacing: .5px;
            text-transform: uppercase;
        }
        .badge-ada { background-color: #51b168; color: #fff; border: 1px solid #c3e6cb; }
        .badge-tidakada { background-color: #f16a76; color: #fff; border: 1px solid #f5c6cb; }

        .card-body { flex: 1; display: flex; flex-direction: column; justify-content: space-between; }
        .card-body h5 { font-weight: bold; font-size: 1.1rem; }
        .card-body p { margin-bottom: 8px; }

        /* Area scroll */
        #scrollArea {
            max-height: 100vh;
            overflow-y: auto;
            scroll-behavior: smooth;
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
        #scrollArea::-webkit-scrollbar { display: none; }

        /* 3 kolom khusus mobile untuk kategori tertentu */
        @media (max-width: 576px) {
            /* sembunyikan logo pojok & beri bg watermark */
            .logo-kiri, .logo-kanan { display: none; }
            body {
                background-image: url('/images/bglogo.png');
                background-repeat: no-repeat;
                background-position: center center;
                background-size: 70%;
                background-attachment: fixed;
            }
            .content-wrapper { background-color: rgba(255,255,255,0.9); padding: 20px; border-radius: 8px; }

            /* util: 3 kolom di mobile */
            .col-mobile-4 { flex: 0 0 33.3333%; max-width: 33.3333%; padding-left: 6px; padding-right: 6px; }
            .col-mobile-4 .card-img-top { height: 140px; }
            .col-mobile-4 .card-body h5 { font-size: 0.8rem; }
            .col-mobile-4 .card-body p { font-size: 0.8rem; }
            .col-mobile-4 .badge-status { padding: 6px 10px; font-size: .85rem; }
        }
    </style>
</head>
<body>
<div class="instansi-header d-flex flex-column justify-content-center align-items-center">
    <div class="d-flex align-items-center">
        <img src="{{ asset('images/logoma.png') }}" alt="Logo Kiri" class="logo-kiri">
        <img src="{{ asset('images/logo.png') }}" alt="Logo Kanan" class="logo-kanan">
        <p class="instansi-title mb-0">Daftar Kehadiran Pejabat</p>
    </div>
    <div><p class="instansi-title2 mb-0">Pengadilan Tinggi Agama Papua Barat</p></div>
    <div id="tanggal"></div>
</div>

<div class="container mt-3 content-wrapper" id="scrollArea">
    <div id="statusContainer"></div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
/* Tanggal lokal Indonesia */
function formatTanggalIndonesia(date) {
    const days = ['Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
    const months = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
    const d = new Date(date);
    return days[d.getDay()] + ', ' + d.getDate() + ' ' + months[d.getMonth()] + ' ' + d.getFullYear();
}
document.getElementById('tanggal').innerText = formatTanggalIndonesia(new Date());

/* Ikon per kategori (pakai label tampil ber-spasi) */
const icons = {
  'Pimpinan': 'fa-user-tie',
  'Hakim Tinggi': 'fa-scale-balanced',
  'Panitera dan Sekretaris': 'fa-folder-open',   // <- ganti label
  'Kepala Bagian': 'fa-sitemap',
  'Panitera Muda': 'fa-gavel',
  'Kepala Sub Bagian': 'fa-user-gear',
  'Panitera Pengganti': 'fa-stamp'
};

/* Alias: nilai dari DB -> label tampil (ber-spasi, final) */
const categoryAliasToDisplay = {
  'Pimpinan': 'Pimpinan',
  'HakimTinggi': 'Hakim Tinggi',
  'Hakim Tinggi': 'Hakim Tinggi',

  // rename lama -> baru
  'Kesekretariatan': 'Panitera dan Sekretaris',
  'Sekretaris dan Panitera': 'Panitera dan Sekretaris', // kalau masih ada data lama
  'Panitera dan Sekretaris': 'Panitera dan Sekretaris',

  'Kepaniteraan': 'Kepala Bagian',
  'Kepala Bagian': 'Kepala Bagian',

  'Panitera Muda': 'Panitera Muda',
  'Kepala Sub Bagian': 'Kepala Sub Bagian',
  'Panitera Pengganti': 'Panitera Pengganti'
};

/* Urutan tampilan (pakai label final ber-spasi) */
const kategoriUrut = [
  'Pimpinan',
  'Hakim Tinggi',
  'Panitera dan Sekretaris',
  'Kepala Bagian',
  'Panitera Muda',
  'Kepala Sub Bagian',
  'Panitera Pengganti'
];

/* Helper */
function toDisplayCategory(rawCat) {
  const key = (rawCat || '').trim();
  return categoryAliasToDisplay[key] || key || 'Panitera Pengganti';
}
function safeIdFrom(text) {
  return 'cat-' + String(text).toLowerCase().replace(/\s+/g, '-');
}

/* Render */
function loadStatus() {
  $.get("/status-json", function(data) {
    $('#statusContainer').html('');

    // kelompokkan menurut label tampil
    const grouped = {};
    data.forEach(emp => {
      const displayCat = toDisplayCategory(emp.category);
      if (!grouped[displayCat]) grouped[displayCat] = [];
      grouped[displayCat].push(emp);
    });

    // render sesuai urutan
    kategoriUrut.forEach(cat => {
      const list = grouped[cat];
      if (!list || list.length === 0) return;

      const icon = icons[cat] || 'fa-user';
      const safeId = safeIdFrom(cat);

      $('#statusContainer').append(`
        <div class="text-center my-4">
          <h4 class="category-title text-dark">
            <i class="fas ${icon}"></i> ${cat}
          </h4>
        </div>
        <div class="row justify-content-center" id="${safeId}"></div>
      `);

      list.forEach(emp => {
        const badgeClass = emp.status === 'ada' ? 'badge-ada' : 'badge-tidakada';
        const badgeText  = emp.status === 'ada' ? 'ADA' : 'KELUAR';

        /* khusus: Hakim Tinggi & Kepala Sub Bagian => 3 kolom di mobile */
        const isThreeColMobile = (cat === 'Hakim Tinggi' || cat === 'Kepala Sub Bagian');
        const colClassMobile = isThreeColMobile ? 'col-mobile-4' : 'col-6';

        $(`#${safeId}`).append(`
          <div class="${colClassMobile} col-sm-4 col-md-3 mb-4">
            <div class="card status-card">
              <img src="/storage/${emp.photo ?? ''}" class="card-img-top" alt="Foto ${emp.name}">
              <div class="card-body text-center">
                <h5 class="card-title">${emp.position ?? ''}</h5>
                <p class="card-text">${emp.name}</p>
                <span class="badge-status ${badgeClass}">${badgeText}</span>
              </div>
            </div>
          </div>
        `);
      });
    });
  });
}
loadStatus();
setInterval(loadStatus, 10000);

/* Auto scroll naik-turun */
let scrollDirection = 1;
setInterval(() => {
  const container = document.getElementById('scrollArea');
  if (!container) return;
  if ((container.scrollTop + container.clientHeight) >= container.scrollHeight) scrollDirection = -1;
  if (container.scrollTop <= 0) scrollDirection = 1;
  container.scrollTop += scrollDirection * 3; // kecepatan
}, 50);
</script>
</body>
</html>
