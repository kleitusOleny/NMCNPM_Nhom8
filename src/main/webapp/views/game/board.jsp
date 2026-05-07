<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("activeTab", "game"); %>
<!DOCTYPE html>

<html lang="vi"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Cờ Vây System - Trận Đấu</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<style>
        .material-symbols-outlined {
            font-family: 'Material Symbols Outlined';
            font-weight: normal;
            font-style: normal;
            font-size: 24px;
            line-height: 1;
            letter-spacing: normal;
            text-transform: none;
            display: inline-block;
            white-space: nowrap;
            word-wrap: normal;
            direction: ltr;
            -webkit-font-feature-settings: 'liga';
            -webkit-font-smoothing: antialiased;
        }
    </style>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-tertiary": "#ffffff",
                        "surface-bright": "#f7f9fb",
                        "secondary": "#725a39",
                        "on-primary-container": "#8191a5",
                        "tertiary-container": "#1e293a",
                        "on-primary-fixed": "#0c1d2c",
                        "primary-fixed": "#d3e4fa",
                        "surface-tint": "#506072",
                        "on-secondary-container": "#765f3d",
                        "primary-container": "#1a2a3a",
                        "on-error": "#ffffff",
                        "error": "#ba1a1a",
                        "surface-container-low": "#f2f4f6",
                        "surface-container-high": "#e6e8ea",
                        "outline-variant": "#c4c6cc",
                        "secondary-fixed": "#feddb3",
                        "primary-fixed-dim": "#b7c8dd",
                        "on-secondary": "#ffffff",
                        "surface-dim": "#d8dadc",
                        "on-tertiary-fixed-variant": "#3c475a",
                        "background": "#f7f9fb",
                        "on-secondary-fixed": "#281801",
                        "on-surface-variant": "#44474c",
                        "surface": "#f7f9fb",
                        "inverse-on-surface": "#eff1f3",
                        "surface-variant": "#e0e3e5",
                        "secondary-fixed-dim": "#e1c299",
                        "tertiary-fixed-dim": "#bcc7dd",
                        "tertiary-fixed": "#d8e3fa",
                        "on-tertiary-container": "#8590a5",
                        "on-secondary-fixed-variant": "#584324",
                        "error-container": "#ffdad6",
                        "on-error-container": "#93000a",
                        "primary": "#041525",
                        "on-primary": "#ffffff",
                        "outline": "#74777d",
                        "on-tertiary-fixed": "#111c2c",
                        "inverse-primary": "#b7c8dd",
                        "surface-container": "#eceef0",
                        "secondary-container": "#fbdbb0",
                        "surface-container-highest": "#e0e3e5",
                        "tertiary": "#091425",
                        "surface-container-lowest": "#ffffff",
                        "on-primary-fixed-variant": "#384859",
                        "inverse-surface": "#2d3133",
                        "on-surface": "#191c1e",
                        "on-background": "#191c1e"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    "spacing": {
                        "gutter": "24px",
                        "xxl": "80px",
                        "xs": "4px",
                        "lg": "24px",
                        "margin": "32px",
                        "unit": "4px",
                        "sm": "8px",
                        "md": "16px",
                        "xl": "48px"
                    },
                    "fontFamily": {
                        "h1-display": ["Inter"],
                        "body-main": ["Inter"],
                        "h2-title": ["Inter"],
                        "body-sm": ["Inter"],
                        "label-caps": ["Inter"],
                        "button-text": ["Inter"]
                    },
                    "fontSize": {
                        "h1-display": ["32px", {"lineHeight": "1.2", "letterSpacing": "-0.02em", "fontWeight": "600"}],
                        "body-main": ["16px", {"lineHeight": "1.6", "letterSpacing": "0", "fontWeight": "400"}],
                        "h2-title": ["24px", {"lineHeight": "1.3", "letterSpacing": "-0.01em", "fontWeight": "500"}],
                        "body-sm": ["14px", {"lineHeight": "1.5", "letterSpacing": "0", "fontWeight": "400"}],
                        "label-caps": ["12px", {"lineHeight": "1.0", "letterSpacing": "0.05em", "fontWeight": "600"}],
                        "button-text": ["15px", {"lineHeight": "1.0", "letterSpacing": "0.01em", "fontWeight": "500"}]
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-surface text-on-surface font-body-main flex h-screen overflow-hidden antialiased">
<!-- SideNavBar (Shared Component) -->
<jsp:include page="/views/layout/user-sidebar.jsp" />
<!-- Main Content Wrapper -->
<div class="flex-1 flex flex-col min-w-0 bg-background relative z-10">
<!-- TopNavBar (Shared Component) -->
<header class="bg-surface-container-lowest flex justify-between items-center w-full px-margin py-md shadow-sm border-b border-outline-variant/20 docked full-width top-0 z-50">
<!-- Left: Context/Brand (Suppressed full logo, showing context) -->
<div class="flex items-center gap-md">
<h2 class="font-h2-title text-h2-title font-bold text-primary">Phòng đấu #4812</h2>
<div class="h-4 w-[1px] bg-outline-variant/50"></div>
<span class="font-label-caps text-label-caps text-on-surface-variant px-2 py-1 bg-surface-container rounded-sm">XẾP HẠNG</span>
</div>
<!-- Right: Actions -->
<div class="flex items-center gap-lg">
<button class="text-on-surface-variant hover:bg-surface-container-high p-2 rounded-full transition-all scale-95 active:scale-90 flex items-center justify-center">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</button>
<button class="text-on-surface-variant hover:bg-surface-container-high p-2 rounded-full transition-all scale-95 active:scale-90 flex items-center justify-center">
<span class="material-symbols-outlined" data-icon="settings">settings</span>
</button>
<div class="h-8 w-[1px] bg-outline-variant/50 mx-sm"></div>
<button class="flex items-center gap-sm text-on-surface-variant hover:text-primary transition-colors">
<span class="font-body-sm text-body-sm font-medium">Đăng xuất</span>
<span class="material-symbols-outlined" style="font-size: 20px;">logout</span>
</button>
</div>
</header>
<!-- Game Workspace (12-column logic abstractly applied via flex) -->
<main class="flex-1 flex flex-col lg:flex-row p-xl gap-xl overflow-hidden items-center justify-center">
<!-- Left/Center Canvas: Go Board Area (7 cols equivalent) -->
<section class="flex-[7] w-full max-w-4xl flex flex-col items-center justify-center">
<!-- Feedback Area -->
<div class="h-10 mb-md flex items-center justify-center w-full">
<div class="px-md py-sm bg-surface-container-lowest border border-outline-variant/20 rounded-full shadow-sm flex items-center gap-sm opacity-80">
<span class="w-3 h-3 rounded-full bg-primary inline-block"></span>
<span class="font-body-sm text-body-sm text-on-surface font-medium">Lượt của Đen (Bạn)</span>
</div>
</div>
<!-- The Goban (Wooden Board) -->
<div class="relative w-full aspect-square bg-secondary-container rounded shadow-[0_10px_25px_-5px_rgba(26,42,58,0.08)] p-[3%] overflow-hidden border-t-[2px] border-l-[2px] border-secondary-fixed/50 border-b-[4px] border-r-[4px] border-[#5a462b]">
<!-- Board Surface Texture (Subtle tint) -->
<div class="absolute inset-0 bg-gradient-to-br from-transparent to-black/5 pointer-events-none"></div>
<!-- 19x19 Grid Lines Wrapper -->
<div class="absolute inset-[4%] border border-on-secondary-container/40">
<!-- Horizontal Lines -->
<div class="absolute inset-0 flex flex-col justify-between pointer-events-none">
<div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div><div class="w-full h-[1px] bg-on-secondary-container/40"></div>
</div>
<!-- Vertical Lines -->
<div class="absolute inset-0 flex justify-between pointer-events-none">
<div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div><div class="h-full w-[1px] bg-on-secondary-container/40"></div>
</div>
<!-- Hoshi (Star Points) -->
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[16.66%] top-[16.66%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[83.33%] top-[16.66%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[16.66%] top-[83.33%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[83.33%] top-[83.33%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[50%] top-[50%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[50%] top-[16.66%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[50%] top-[83.33%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[16.66%] top-[50%]"></div>
<div class="absolute w-2 h-2 bg-on-secondary-container rounded-full -translate-x-1/2 -translate-y-1/2 left-[83.33%] top-[50%]"></div>
<!-- Example Stones (Simulating a game in progress) -->
<!-- Black Stone -->
<div class="absolute w-[5.6%] h-[5.6%] rounded-full bg-[#111] shadow-[inset_-2px_-2px_4px_rgba(255,255,255,0.2),2px_2px_4px_rgba(0,0,0,0.5)] -translate-x-1/2 -translate-y-1/2 left-[16.66%] top-[16.66%]"></div>
<!-- White Stone -->
<div class="absolute w-[5.6%] h-[5.6%] rounded-full bg-[#fcfcfc] shadow-[inset_-2px_-2px_6px_rgba(0,0,0,0.1),1px_2px_3px_rgba(0,0,0,0.3)] -translate-x-1/2 -translate-y-1/2 left-[83.33%] top-[16.66%]"></div>
<!-- More stones... -->
<div class="absolute w-[5.6%] h-[5.6%] rounded-full bg-[#111] shadow-[inset_-2px_-2px_4px_rgba(255,255,255,0.2),2px_2px_4px_rgba(0,0,0,0.5)] -translate-x-1/2 -translate-y-1/2 left-[22.22%] top-[16.66%]"></div>
<div class="absolute w-[5.6%] h-[5.6%] rounded-full bg-[#fcfcfc] shadow-[inset_-2px_-2px_6px_rgba(0,0,0,0.1),1px_2px_3px_rgba(0,0,0,0.3)] -translate-x-1/2 -translate-y-1/2 left-[27.77%] top-[22.22%]"></div>
<!-- Last move indicator -->
<div class="absolute w-[5.6%] h-[5.6%] rounded-full bg-[#111] shadow-[inset_-2px_-2px_4px_rgba(255,255,255,0.2),2px_2px_4px_rgba(0,0,0,0.5)] -translate-x-1/2 -translate-y-1/2 left-[50%] top-[50%] flex items-center justify-center">
<div class="w-2 h-2 rounded-full border-2 border-surface-container-lowest"></div>
</div>
</div>
</div>
<!-- Bottom Controls (Primary Actions) -->
<div class="w-full flex justify-between items-center mt-xl px-lg">
<div class="flex gap-md">
<button class="bg-surface-container-lowest text-on-surface border border-outline-variant/50 font-button-text text-button-text py-sm px-lg rounded-lg hover:bg-surface-container-low transition-colors flex items-center gap-sm">
<span class="material-symbols-outlined" style="font-size: 18px;">block</span>
                            Đầu hàng
                        </button>
<button class="bg-surface-container-lowest text-on-surface border border-outline-variant/50 font-button-text text-button-text py-sm px-lg rounded-lg hover:bg-surface-container-low transition-colors flex items-center gap-sm">
<span class="material-symbols-outlined" style="font-size: 18px;">skip_next</span>
                            Bỏ lượt
                        </button>
</div>
<button class="bg-primary text-on-primary font-button-text text-button-text py-sm px-xl rounded-lg hover:bg-tertiary-container shadow-sm transition-all flex items-center gap-sm">
<span class="material-symbols-outlined" style="font-size: 18px;">ads_click</span>
                        Đặt quân cờ
                    </button>
</div>
</section>
<!-- Right Sidebar: Player Info & Tools (5 cols equivalent) -->
<aside class="flex-[5] w-full max-w-sm h-full flex flex-col gap-lg border-l border-outline-variant/10 pl-xl">
<!-- Opponent Panel (Top) -->
<div class="bg-surface-container-lowest border-t-2 border-surface-tint/20 rounded-lg p-md shadow-sm border border-outline-variant/10">
<div class="flex items-center gap-md mb-md">
<div class="w-14 h-14 rounded-full overflow-hidden border-2 border-surface-container shadow-sm bg-surface-variant flex-shrink-0">
<img alt="Avatar Opponent" class="w-full h-full object-cover" data-alt="A close-up portrait of an older, wise-looking Asian man with subtle wrinkles, conveying deep thought and concentration. The lighting is soft and natural, emphasizing a calm and focused mood suitable for a strategic mind. The background is a minimalist, slightly blurred out-of-focus wood texture to match a high-end Go game aesthetic. The overall color palette is warm and natural." src="https://lh3.googleusercontent.com/aida-public/AB6AXuDzPjl8Dy8tYfGqbOv_WFh66BXyoWtQlADMggS5cZ4dkUGmuXpNaUQz5D0KM2aHLZsNBNmS167gIethFOpLQShGv9yYnO8j3r9MgWqYIByq_3stDIsSSQgd9TTuv-jilMBtZyqHbjYhUEj7gpbb4-IIXiInzGXWkzt1zbPxIoEkRsP-L1LnlbFyshvZ3vLBW-Vw9NJPYmJqo-Qh9nUD8A-ExuHe4pxH7J8sVz7CrsZdCewpjQ10NxRDWdGUDXG1zMZrcWM0GgAT4Yr2"/>
</div>
<div class="flex-1">
<h3 class="font-h2-title text-[18px] font-semibold text-on-surface line-clamp-1">Thiên Nguyên Lão Sư</h3>
<div class="flex items-center gap-sm mt-1">
<span class="bg-surface-container-high text-primary font-label-caps text-[10px] px-2 py-0.5 rounded-full border border-outline-variant/20">5 DAN</span>
<span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1">
<span class="w-3 h-3 rounded-full bg-surface-container-lowest border border-outline-variant/50 inline-block shadow-sm"></span>
                                    Trắng
                                </span>
</div>
</div>
</div>
<!-- Stats/Timer Grid -->
<div class="grid grid-cols-2 gap-md bg-surface p-sm rounded-md border border-outline-variant/10">
<div>
<span class="font-label-caps text-[10px] text-on-surface-variant block mb-1">TÙ BINH</span>
<span class="font-h2-title text-[20px] font-medium text-on-surface">3</span>
</div>
<div class="text-right flex flex-col items-end">
<span class="font-label-caps text-[10px] text-on-surface-variant block mb-1">THỜI GIAN</span>
<span class="font-h1-display text-[24px] font-medium text-surface-tint tracking-tight">08:42</span>
<!-- Byo-yomi -->
<div class="flex gap-xs mt-1">
<div class="w-4 h-1.5 bg-surface-variant rounded-full"></div>
<div class="w-4 h-1.5 bg-surface-variant rounded-full"></div>
<div class="w-4 h-1.5 bg-surface-variant rounded-full"></div>
</div>
</div>
</div>
</div>
<!-- Move History / Chat Area -->
<div class="flex-1 bg-surface-container-lowest border-t-2 border-surface-tint/20 rounded-lg shadow-sm border border-outline-variant/10 flex flex-col overflow-hidden">
<!-- Tab Header -->
<div class="flex border-b border-outline-variant/10">
<button class="flex-1 py-sm font-button-text text-button-text text-primary border-b-2 border-primary font-medium">Lịch sử nước đi</button>
<button class="flex-1 py-sm font-button-text text-button-text text-on-surface-variant hover:bg-surface-container transition-colors">Chat</button>
</div>
<!-- List -->
<div class="flex-1 overflow-y-auto bg-surface p-sm space-y-1">
<div class="flex justify-between items-center py-2 px-md bg-surface-container-lowest rounded-sm border border-outline-variant/5">
<span class="font-body-sm text-body-sm text-on-surface-variant w-8">1</span>
<span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface flex-1">
<span class="w-3 h-3 rounded-full bg-[#111] inline-block shadow-sm"></span> Đen
                            </span>
<span class="font-label-caps text-label-caps text-on-surface font-semibold bg-surface px-2 py-1 rounded">Q4</span>
</div>
<div class="flex justify-between items-center py-2 px-md bg-surface rounded-sm">
<span class="font-body-sm text-body-sm text-on-surface-variant w-8">2</span>
<span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface flex-1">
<span class="w-3 h-3 rounded-full bg-surface-container-lowest border border-outline-variant/50 inline-block shadow-sm"></span> Trắng
                            </span>
<span class="font-label-caps text-label-caps text-on-surface font-semibold bg-surface-container px-2 py-1 rounded">D16</span>
</div>
<div class="flex justify-between items-center py-2 px-md bg-surface-container-lowest rounded-sm border border-outline-variant/5">
<span class="font-body-sm text-body-sm text-on-surface-variant w-8">3</span>
<span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface flex-1">
<span class="w-3 h-3 rounded-full bg-[#111] inline-block shadow-sm"></span> Đen
                            </span>
<span class="font-label-caps text-label-caps text-on-surface font-semibold bg-surface px-2 py-1 rounded">Q16</span>
</div>
<div class="flex justify-between items-center py-2 px-md bg-surface rounded-sm">
<span class="font-body-sm text-body-sm text-on-surface-variant w-8">4</span>
<span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface flex-1">
<span class="w-3 h-3 rounded-full bg-surface-container-lowest border border-outline-variant/50 inline-block shadow-sm"></span> Trắng
                            </span>
<span class="font-label-caps text-label-caps text-on-surface font-semibold bg-surface-container px-2 py-1 rounded">D4</span>
</div>
<!-- Current move highlight -->
<div class="flex justify-between items-center py-2 px-md bg-primary/5 rounded-sm border border-primary/20">
<span class="font-body-sm text-body-sm text-primary font-medium w-8">5</span>
<span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface flex-1 font-medium">
<span class="w-3 h-3 rounded-full bg-[#111] inline-block shadow-sm ring-2 ring-primary/30"></span> Đen
                            </span>
<span class="font-label-caps text-label-caps text-primary font-bold bg-surface px-2 py-1 rounded shadow-sm">K10</span>
</div>
</div>
</div>
<!-- Self Panel (Bottom - Active Turn) -->
<div class="bg-surface-container-lowest border-t-2 border-primary rounded-lg p-md shadow-md border border-outline-variant/10 relative overflow-hidden">
<!-- Active turn glow -->
<div class="absolute inset-0 bg-gradient-to-r from-primary/5 to-transparent pointer-events-none"></div>
<div class="flex items-center gap-md mb-md relative z-10">
<div class="w-14 h-14 rounded-full overflow-hidden border-2 border-primary shadow-sm bg-surface-variant flex-shrink-0">
<img alt="Avatar Self" class="w-full h-full object-cover" data-alt="A portrait of a young, intense male Go player staring thoughtfully off-camera, wearing a minimalist black turtleneck. The lighting is dramatic and directional, creating deep shadows that emphasize focus and tactical calculation. The background is pure, neutral light grey to maintain the minimalist, clean UI aesthetic. The overall mood is modern, serious, and competitive." src="https://lh3.googleusercontent.com/aida-public/AB6AXuAalLOgi2PnUOFgnPnNhvhd9NhwIBqV2mLDNORyrqBJ5Hrxx7-M9BldP7PezEc2RtcFUOJ5OiMepLawfZkalmyu1F9mpK2IiVTxrTUoXvfd6uvVR_QgB96f4WDe-0DBn9dsvBVRx-E35bnimK4TiKC1x9JXgXQHo7u68trjD8NhU3e9-9KGNLyFteTHJ7sGIPEt4diYuiWFlPVGGCmIvhWA3bQo0HmYzqBLyQ9xu-e0OAPockLY1MiHARuyAC1HmHaZvB8lt0ICEiK_"/>
</div>
<div class="flex-1">
<h3 class="font-h2-title text-[18px] font-bold text-on-surface line-clamp-1">Kỳ Thủ Hiện Tại</h3>
<div class="flex items-center gap-sm mt-1">
<span class="bg-primary/10 text-primary font-label-caps text-[10px] px-2 py-0.5 rounded-full border border-primary/20 font-bold">4 DAN</span>
<span class="font-body-sm text-body-sm text-on-surface font-medium flex items-center gap-1">
<span class="w-3 h-3 rounded-full bg-[#111] inline-block shadow-sm"></span>
                                    Đen
                                </span>
</div>
</div>
</div>
<!-- Stats/Timer Grid -->
<div class="grid grid-cols-2 gap-md bg-primary/5 p-sm rounded-md border border-primary/10 relative z-10">
<div>
<span class="font-label-caps text-[10px] text-primary block mb-1">TÙ BINH</span>
<span class="font-h2-title text-[20px] font-bold text-primary">1</span>
</div>
<div class="text-right flex flex-col items-end">
<span class="font-label-caps text-[10px] text-primary block mb-1 font-bold">THỜI GIAN CỦA BẠN</span>
<span class="font-h1-display text-[24px] font-bold text-primary tracking-tight">12:15</span>
<!-- Byo-yomi Active -->
<div class="flex gap-xs mt-1">
<div class="w-4 h-1.5 bg-primary rounded-full shadow-[0_0_8px_rgba(4,21,37,0.4)]"></div>
<div class="w-4 h-1.5 bg-primary/30 rounded-full"></div>
<div class="w-4 h-1.5 bg-primary/30 rounded-full"></div>
</div>
</div>
</div>
</div>
</aside>
</main>
</div>
</body></html>