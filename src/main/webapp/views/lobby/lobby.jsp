<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("activeTab", "lobby"); %>
<!DOCTYPE html>

<html lang="vi"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Sảnh chờ - Tâm Thế</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
          darkMode: "class",
          theme: {
            extend: {
              "colors": {
                      "surface": "#f7f9fb",
                      "secondary": "#725a39",
                      "on-primary-fixed": "#0c1d2c",
                      "inverse-primary": "#b7c8dd",
                      "surface-container-highest": "#e0e3e5",
                      "on-secondary-fixed-variant": "#584324",
                      "primary-container": "#1a2a3a",
                      "tertiary-container": "#1e293a",
                      "background": "#f7f9fb",
                      "inverse-surface": "#2d3133",
                      "on-primary-fixed-variant": "#384859",
                      "on-primary-container": "#8191a5",
                      "surface-variant": "#e0e3e5",
                      "outline-variant": "#c4c6cc",
                      "on-primary": "#ffffff",
                      "primary-fixed-dim": "#b7c8dd",
                      "outline": "#74777d",
                      "on-error": "#ffffff",
                      "primary": "#041525",
                      "on-secondary": "#ffffff",
                      "tertiary": "#091425",
                      "on-tertiary": "#ffffff",
                      "on-background": "#191c1e",
                      "secondary-fixed": "#feddb3",
                      "on-secondary-container": "#765f3d",
                      "surface-container-high": "#e6e8ea",
                      "tertiary-fixed": "#d8e3fa",
                      "primary-fixed": "#d3e4fa",
                      "on-tertiary-fixed": "#111c2c",
                      "surface-dim": "#d8dadc",
                      "error-container": "#ffdad6",
                      "surface-container-low": "#f2f4f6",
                      "surface-container": "#eceef0",
                      "on-tertiary-fixed-variant": "#3c475a",
                      "on-surface-variant": "#44474c",
                      "on-secondary-fixed": "#281801",
                      "on-tertiary-container": "#8590a5",
                      "on-error-container": "#93000a",
                      "inverse-on-surface": "#eff1f3",
                      "secondary-container": "#fbdbb0",
                      "surface-bright": "#f7f9fb",
                      "on-surface": "#191c1e",
                      "surface-container-lowest": "#ffffff",
                      "surface-tint": "#506072",
                      "tertiary-fixed-dim": "#bcc7dd",
                      "secondary-fixed-dim": "#e1c299",
                      "error": "#ba1a1a"
              },
              "borderRadius": {
                      "DEFAULT": "0.25rem",
                      "lg": "0.5rem",
                      "xl": "0.75rem",
                      "full": "9999px"
              },
              "spacing": {
                      "unit": "4px",
                      "lg": "24px",
                      "xxl": "80px",
                      "sm": "8px",
                      "md": "16px",
                      "xl": "48px",
                      "xs": "4px",
                      "gutter": "24px",
                      "margin": "32px"
              },
              "fontFamily": {
                      "h1-display": [
                              "Inter"
                      ],
                      "body-main": [
                              "Inter"
                      ],
                      "button-text": [
                              "Inter"
                      ],
                      "label-caps": [
                              "Inter"
                      ],
                      "body-sm": [
                              "Inter"
                      ],
                      "h2-title": [
                              "Inter"
                      ]
              },
              "fontSize": {
                      "h1-display": [
                              "32px",
                              {
                                      "lineHeight": "1.2",
                                      "letterSpacing": "-0.02em",
                                      "fontWeight": "600"
                              }
                      ],
                      "body-main": [
                              "16px",
                              {
                                      "lineHeight": "1.6",
                                      "letterSpacing": "0",
                                      "fontWeight": "400"
                              }
                      ],
                      "button-text": [
                              "15px",
                              {
                                      "lineHeight": "1.0",
                                      "letterSpacing": "0.01em",
                                      "fontWeight": "500"
                              }
                      ],
                      "label-caps": [
                              "12px",
                              {
                                      "lineHeight": "1.0",
                                      "letterSpacing": "0.05em",
                                      "fontWeight": "600"
                              }
                      ],
                      "body-sm": [
                              "14px",
                              {
                                      "lineHeight": "1.5",
                                      "letterSpacing": "0",
                                      "fontWeight": "400"
                              }
                      ],
                      "h2-title": [
                              "24px",
                              {
                                      "lineHeight": "1.3",
                                      "letterSpacing": "-0.01em",
                                      "fontWeight": "500"
                              }
                      ]
              }
      },
          },
        }
    </script>
<style>
        .wood-texture-subtle {
            background-color: #f7f9fb;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.8' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100' height='100' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");
        }
        .board-shadow {
            box-shadow: 0 10px 25px -5px rgba(26, 42, 58, 0.08);
        }
    </style>
</head>
<body class="bg-surface text-on-surface font-body-main antialiased flex h-screen overflow-hidden">
<!-- SideNavBar -->
<jsp:include page="/views/layout/user-sidebar.jsp" />
<!-- Main Content Area -->
<main class="flex-1 flex flex-col h-full overflow-hidden bg-surface relative">
<!-- TopNavBar (Mobile only for full nav, minimal on desktop since SideNav is present) -->
<header class="md:hidden flex justify-between items-center w-full px-margin py-md bg-surface-container-lowest dark:bg-primary shadow-sm border-b border-outline-variant/20 z-50">
<h1 class="font-h2-title text-h2-title font-bold text-primary dark:text-primary-fixed">Cờ Vây System</h1>
<div class="flex items-center gap-md">
<button class="text-primary dark:text-primary-fixed-dim hover:bg-surface-container-high p-2 rounded-full transition-all">
<span class="material-symbols-outlined">notifications</span>
</button>
<button class="text-primary dark:text-primary-fixed-dim hover:bg-surface-container-high p-2 rounded-full transition-all">
<span class="material-symbols-outlined">settings</span>
</button>
<img alt="Ảnh đại diện kỳ thủ" class="w-8 h-8 rounded-full border border-outline-variant" data-alt="A clean, professional headshot of a Go player. The lighting is soft and flattering, typical of a modern studio portrait. The background is a muted, neutral gray to ensure focus remains on the subject. The subject wears simple, elegant clothing fitting a minimalist aesthetic." src="https://lh3.googleusercontent.com/aida-public/AB6AXuDxOnGcBG15gaPXZaZtqCd1pgAJZ5f4-99mNz1lni4nLrPI-ocnYUL5yPYitFf-BIBgT2PiB1HqDUm4Pstpv5iXkIOwLCr8Wy8jiOFPuiAW3RGXhrhJNOMMJ0KG3O5eUpEcBm06D_zgGJskaAg9YoE9UGKrYH0rAaVuGg11Ers417SP_62a_56Z0v30w_BftVZNYrp3DJrbg-1ACxOcMn3X7ImCuQ-CDSEW5BPVnXC3Ku0fu68B8nnWaS6uGPsg9hH0rvnxnF-9CZga"/>
</div>
</header>
<!-- Page Header & Actions -->
<div class="px-xl py-lg flex flex-col sm:flex-row justify-between items-start sm:items-center gap-md border-b border-outline-variant/20 bg-surface-container-lowest">
<div>
<h2 class="font-h1-display text-h1-display text-primary mb-xs">Sảnh chờ</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Tìm kiếm đối thủ hoặc tạo phòng đấu mới.</p>
</div>
<div class="flex items-center gap-md w-full sm:w-auto">
<div class="relative w-full sm:w-64">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-surface border-b border-outline-variant focus:border-primary focus:ring-0 transition-colors font-body-sm text-body-sm" placeholder="Tìm kiếm phòng..." type="text"/>
</div>
<button class="hidden sm:flex items-center gap-xs px-4 py-2 bg-primary text-on-primary rounded-lg font-button-text text-button-text hover:bg-tertiary transition-colors shadow-sm whitespace-nowrap" onclick="window.location.href='${pageContext.request.contextPath}/create-room'">
<span class="material-symbols-outlined text-[18px]">add</span>
                    Tạo phòng
                </button>
</div>
</div>
<!-- Filters -->
<div class="px-xl py-md flex flex-wrap gap-sm">
<button class="px-4 py-1.5 rounded-full bg-secondary-container text-on-secondary-container font-label-caps text-label-caps border border-transparent">Tất cả</button>
<button class="px-4 py-1.5 rounded-full bg-surface text-on-surface-variant font-label-caps text-label-caps border border-outline-variant hover:bg-surface-container transition-colors">Tiêu chuẩn</button>
<button class="px-4 py-1.5 rounded-full bg-surface text-on-surface-variant font-label-caps text-label-caps border border-outline-variant hover:bg-surface-container transition-colors">Chớp nhoáng (Blitz)</button>
<button class="px-4 py-1.5 rounded-full bg-surface text-on-surface-variant font-label-caps text-label-caps border border-outline-variant hover:bg-surface-container transition-colors">Đang đấu</button>
</div>
<!-- Room Grid (Bento style approach for varied card sizes) -->
<div class="flex-1 overflow-y-auto px-xl pb-xl">
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-lg">
<!-- Room Card 1 (Waiting) -->
<div class="bg-surface-container-lowest rounded-xl board-shadow border-t-2 border-secondary overflow-hidden flex flex-col group transition-transform hover:-translate-y-1">
<div class="p-md border-b border-surface-variant flex justify-between items-start">
<div>
<span class="inline-block px-2 py-1 bg-surface-container rounded text-on-surface-variant font-label-caps text-[10px] mb-2 tracking-wider">TIÊU CHUẨN</span>
<h3 class="font-h2-title text-[18px] text-primary">Phòng của Hắc Bạch Tử</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1 flex items-center gap-xs">
<span class="material-symbols-outlined text-[14px]">schedule</span> 15m + 30s x 3
                            </p>
</div>
<div class="w-8 h-8 rounded bg-surface flex items-center justify-center text-secondary border border-outline-variant/30">
<span class="material-symbols-outlined text-[18px]">lock_open</span>
</div>
</div>
<div class="p-md flex-1 flex flex-col justify-center wood-texture-subtle">
<div class="flex items-center justify-between px-sm">
<div class="flex flex-col items-center gap-sm">
<div class="relative">
<img alt="Player 1" class="w-12 h-12 rounded-full border-2 border-primary object-cover" data-alt="A portrait of a male Go player with dark hair, looking thoughtful. The image is framed against a minimalist light background, fitting the clean, focused aesthetic of a professional gaming platform. Lighting is soft and even." src="https://lh3.googleusercontent.com/aida-public/AB6AXuDoRUpz7ed3IhS6D8ywnkYQf6YZId8dDssgpT4eLmmh_Q5seUovRzo4Q-KQLDLHXZLvf3rdQc4gHFzI7WYzTO6xbFdh906u-10TPoDa_Q3DnY3G7r43vhGPLYtBoB2kzNlSgi8Ga63987IKZJLHc8obLAyIG7mENYgPcvwiSwiEgxDxYoQ9DuvDhbJ7fYKcvPo5YD0r9jctQdb7g24ZgTHPiQmKIRes5YFBstA2rzvezCKLfV-eNjrlR-VM_hkSErYLPX-ZdlZfHwLd"/>
<div class="absolute -bottom-1 -right-1 w-4 h-4 bg-primary rounded-full border border-surface flex items-center justify-center">
<div class="w-2 h-2 rounded-full bg-white"></div>
</div>
</div>
<div class="text-center">
<span class="font-button-text text-[13px] block text-primary">HắcBạchTử</span>
<span class="font-label-caps text-[10px] text-on-surface-variant">5 Dan</span>
</div>
</div>
<div class="font-h2-title text-outline-variant px-4">VS</div>
<div class="flex flex-col items-center gap-sm opacity-50">
<div class="w-12 h-12 rounded-full border-2 border-dashed border-outline-variant flex items-center justify-center bg-surface">
<span class="material-symbols-outlined text-outline-variant">person_add</span>
</div>
<div class="text-center">
<span class="font-button-text text-[13px] block text-on-surface-variant">Đang chờ...</span>
<span class="font-label-caps text-[10px] text-transparent">-</span>
</div>
</div>
</div>
</div>
<div class="p-md bg-surface-container-lowest mt-auto">
<button class="w-full py-2 bg-surface text-primary border border-outline-variant hover:border-primary hover:bg-surface-container rounded font-button-text text-button-text transition-all" onclick="window.location.href='${pageContext.request.contextPath}/game'">Tham gia</button>
</div>
</div>
<!-- Room Card 2 (In Progress) -->
<div class="bg-surface-container-lowest rounded-xl board-shadow border-t-2 border-outline-variant overflow-hidden flex flex-col group transition-transform hover:-translate-y-1">
<div class="p-md border-b border-surface-variant flex justify-between items-start">
<div>
<span class="inline-block px-2 py-1 bg-surface-container rounded text-on-surface-variant font-label-caps text-[10px] mb-2 tracking-wider">BLITZ</span>
<h3 class="font-h2-title text-[18px] text-primary">Giao hữu cuối tuần</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1 flex items-center gap-xs">
<span class="material-symbols-outlined text-[14px]">schedule</span> 5m + 10s x 5
                            </p>
</div>
<div class="flex gap-1">
<span class="w-2 h-2 rounded-full bg-error mt-2 animate-pulse"></span>
<span class="font-label-caps text-[10px] text-error mt-1">ĐANG ĐẤU</span>
</div>
</div>
<div class="p-md flex-1 flex flex-col justify-center wood-texture-subtle relative">
<div class="flex items-center justify-between px-sm relative z-10">
<div class="flex flex-col items-center gap-sm">
<div class="relative">
<img alt="Player 1" class="w-12 h-12 rounded-full border-2 border-primary object-cover" data-alt="Portrait of a female Go player looking focused. Soft lighting typical of a modern digital profile avatar. The background is a subtle warm gray, maintaining the minimalist and professional tone of the application." src="https://lh3.googleusercontent.com/aida-public/AB6AXuCWWrulB05A2t06cMk5JeVAwsidG8MuKCpBGrThh9CeaeoBhXASif1YUp8RyniupAuVmdsHYyilcLlM-svlcy3kBH9vWyNn03MaIFjnm6h05SNPfyhiXd7852ZeRMItEcFp8dOf33a0cREY2yQOLfV0PjGygsgBXL6VloOI67T_eMHGE8b2_7qq0Yf-tHnNDXOR790yBqh5HQd4_yMgzjN3sdSdAq04C00scygAS3fgtdGdeHZlhhZHXiDerr3LjWsHSs-ncWWKY7cF"/>
<div class="absolute -bottom-1 -right-1 w-4 h-4 bg-primary rounded-full border border-surface flex items-center justify-center">
<div class="w-2 h-2 rounded-full bg-white"></div>
</div>
</div>
<div class="text-center">
<span class="font-button-text text-[13px] block text-primary">LinhCầm</span>
<span class="font-label-caps text-[10px] text-on-surface-variant">3 Dan</span>
</div>
</div>
<div class="flex flex-col items-center">
<div class="font-h2-title text-primary px-4 mb-1">Nước 42</div>
<div class="w-full bg-surface-variant rounded-full h-1.5">
<div class="bg-secondary h-1.5 rounded-full" style="width: 45%"></div>
</div>
</div>
<div class="flex flex-col items-center gap-sm">
<div class="relative">
<img alt="Player 2" class="w-12 h-12 rounded-full border-2 border-surface-variant object-cover" data-alt="Portrait of a male Go player with a calm expression. The image uses soft studio lighting against a clean white background, aligning with the minimalist, high-focus aesthetic of the platform." src="https://lh3.googleusercontent.com/aida-public/AB6AXuCix34ZT5rN7NfvF-lf-rTibPkad4-4TwIacCiCcppNMuuEHgmmM8CdSGgawWYSR0INFQEejtJy-u-hPwQzTI-IRhJfb7UExlRan4v0KZ2AaUl2gMzt0rqyE1QqdO8kXHQJe5gx1y51_uP_aae6DnGl9YZwVTh9MZBNPntl1B60SsaHFu0jFcbwsr4ZPkb3IC6Lj49XE8BClcB0sYqfQk7ADq2bX28l22LS992COFBYHhTrMk8ReJmjWQm16BXAtl8soOekQgDLoNMQ"/>
<div class="absolute -bottom-1 -left-1 w-4 h-4 bg-surface-variant rounded-full border border-surface"></div>
</div>
<div class="text-center">
<span class="font-button-text text-[13px] block text-primary">PhongVân</span>
<span class="font-label-caps text-[10px] text-on-surface-variant">4 Dan</span>
</div>
</div>
</div>
</div>
<div class="p-md bg-surface-container-lowest mt-auto">
<button class="w-full py-2 bg-surface-container text-on-surface-variant border border-transparent hover:bg-surface-variant rounded font-button-text text-button-text transition-all flex items-center justify-center gap-xs" onclick="window.location.href='${pageContext.request.contextPath}/game/1/detail'">
<span class="material-symbols-outlined text-[16px]">visibility</span>
                            Vào xem
                        </button>
</div>
</div>
<!-- Create Room Card (Action area) -->
<div class="bg-transparent rounded-xl border-2 border-dashed border-outline-variant/50 hover:border-primary/50 overflow-hidden flex flex-col justify-center items-center p-xl cursor-pointer transition-colors group md:hidden">
<div class="w-16 h-16 rounded-full bg-surface-container-high group-hover:bg-primary-fixed flex items-center justify-center mb-md transition-colors">
<span class="material-symbols-outlined text-[32px] text-on-surface-variant group-hover:text-primary">add</span>
</div>
<h3 class="font-h2-title text-[18px] text-primary mb-xs">Tạo phòng mới</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant text-center max-w-[200px]">Thiết lập luật chơi và thời gian theo ý muốn.</p>
</div>
</div>
</div>
<!-- Mobile BottomNavBar (Only visible on small screens) -->
<nav class="md:hidden flex justify-around items-center w-full bg-surface-container-lowest border-t border-outline-variant/20 py-sm pb-safe fixed bottom-0 z-50">
<a class="flex flex-col items-center p-2 text-primary font-bold" href="${pageContext.request.contextPath}/lobby">
<span class="material-symbols-outlined mb-1">view_quilt</span>
<span class="font-label-caps text-[10px]">Sảnh chờ</span>
</a>
<a class="flex flex-col items-center p-2 text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/history">
<span class="material-symbols-outlined mb-1">history</span>
<span class="font-label-caps text-[10px]">Lịch sử</span>
</a>
<div class="relative -top-5">
<button class="w-12 h-12 rounded-full bg-primary text-on-primary flex items-center justify-center shadow-md" onclick="window.location.href='${pageContext.request.contextPath}/create-room'">
<span class="material-symbols-outlined">add</span>
</button>
</div>
<a class="flex flex-col items-center p-2 text-on-surface-variant hover:text-primary transition-colors" href="#">
<span class="material-symbols-outlined mb-1">group</span>
<span class="font-label-caps text-[10px]">Bạn bè</span>
</a>
<a class="flex flex-col items-center p-2 text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/profile">
<span class="material-symbols-outlined mb-1">person</span>
<span class="font-label-caps text-[10px]">Hồ sơ</span>
</a>
</nav>
</main>
</body></html>