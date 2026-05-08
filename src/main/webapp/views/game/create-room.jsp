<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("activeTab", "game"); %>
<!DOCTYPE html>

<html lang="vi"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Tạo phòng - Tâm Thế</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "surface-container-high": "#e6e8ea",
                    "background": "#f7f9fb",
                    "on-secondary": "#ffffff",
                    "inverse-on-surface": "#eff1f3",
                    "on-primary-fixed-variant": "#384859",
                    "tertiary-fixed": "#d8e3fa",
                    "surface-container": "#eceef0",
                    "on-background": "#191c1e",
                    "surface-bright": "#f7f9fb",
                    "error-container": "#ffdad6",
                    "primary-container": "#1a2a3a",
                    "on-primary-fixed": "#0c1d2c",
                    "surface-container-highest": "#e0e3e5",
                    "on-tertiary": "#ffffff",
                    "tertiary": "#091425",
                    "error": "#ba1a1a",
                    "on-secondary-container": "#765f3d",
                    "surface-container-low": "#f2f4f6",
                    "secondary": "#725a39",
                    "on-error-container": "#93000a",
                    "tertiary-fixed-dim": "#bcc7dd",
                    "tertiary-container": "#1e293a",
                    "secondary-fixed-dim": "#e1c299",
                    "surface": "#f7f9fb",
                    "outline": "#74777d",
                    "on-primary": "#ffffff",
                    "outline-variant": "#c4c6cc",
                    "surface-container-lowest": "#ffffff",
                    "inverse-surface": "#2d3133",
                    "on-tertiary-fixed": "#111c2c",
                    "on-primary-container": "#8191a5",
                    "primary-fixed-dim": "#b7c8dd",
                    "primary-fixed": "#d3e4fa",
                    "on-secondary-fixed": "#281801",
                    "on-secondary-fixed-variant": "#584324",
                    "on-tertiary-container": "#8590a5",
                    "on-surface": "#191c1e",
                    "secondary-fixed": "#feddb3",
                    "on-tertiary-fixed-variant": "#3c475a",
                    "inverse-primary": "#b7c8dd",
                    "surface-variant": "#e0e3e5",
                    "primary": "#041525",
                    "on-error": "#ffffff",
                    "surface-tint": "#506072",
                    "surface-dim": "#d8dadc",
                    "secondary-container": "#fbdbb0",
                    "on-surface-variant": "#44474c"
            },
            "borderRadius": {
                    "DEFAULT": "0.25rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
            },
            "spacing": {
                    "lg": "24px",
                    "sm": "8px",
                    "unit": "4px",
                    "xl": "48px",
                    "margin": "32px",
                    "xxl": "80px",
                    "xs": "4px",
                    "md": "16px",
                    "gutter": "24px"
            },
            "fontFamily": {
                    "body-sm": [
                            "Inter"
                    ],
                    "label-caps": [
                            "Inter"
                    ],
                    "h2-title": [
                            "Inter"
                    ],
                    "h1-display": [
                            "Inter"
                    ],
                    "body-main": [
                            "Inter"
                    ],
                    "button-text": [
                            "Inter"
                    ]
            },
            "fontSize": {
                    "body-sm": [
                            "14px",
                            {
                                    "lineHeight": "1.5",
                                    "letterSpacing": "0",
                                    "fontWeight": "400"
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
                    "h2-title": [
                            "24px",
                            {
                                    "lineHeight": "1.3",
                                    "letterSpacing": "-0.01em",
                                    "fontWeight": "500"
                            }
                    ],
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
                    ]
            }
    },
        },
      }
    </script>
</head>
<body class="bg-background text-on-background font-body-main text-body-main min-h-screen flex items-center justify-center p-md antialiased">
<!-- Modal Container -->
<div class="bg-surface-container-lowest rounded-xl shadow-[0_10px_25px_-5px_rgba(26,42,58,0.08)] w-full max-w-2xl border-t-[2px] border-secondary-fixed-dim flex flex-col overflow-hidden">
<!-- Header -->
<div class="px-margin py-lg border-b border-outline-variant/20 flex justify-between items-center bg-surface-container-lowest">
<div>
<h1 class="font-h2-title text-h2-title text-primary">Tạo phòng mới</h1>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-xs">Thiết lập các thông số cho ván đấu của bạn.</p>
</div>
<button aria-label="Đóng" class="text-on-surface-variant hover:bg-surface-container-high p-sm rounded-full transition-colors flex items-center justify-center">
<span class="material-symbols-outlined">close</span>
</button>
</div>
<!-- Body / Form -->
<div class="p-margin flex flex-col gap-lg overflow-y-auto">
<!-- Section: General -->
<div class="flex flex-col gap-md">
<div class="flex items-center gap-sm">
<span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">info</span>
<h2 class="font-label-caps text-label-caps text-on-surface-variant uppercase">Thông tin chung</h2>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 gap-md">
<!-- Room Name -->
<div class="flex flex-col gap-xs">
<label class="font-body-sm text-body-sm text-on-surface-variant" for="room_name">Tên phòng</label>
<input class="bg-surface-container-lowest border-0 border-b border-outline-variant text-primary focus:ring-0 focus:border-primary transition-colors px-0 py-sm font-body-main text-body-main placeholder-outline-variant" id="room_name" type="text" value="Phòng của Người chơi"/>
</div>
<!-- Match Type -->
<div class="flex flex-col gap-xs">
<label class="font-body-sm text-body-sm text-on-surface-variant">Loại ván đấu</label>
<div class="flex rounded-lg overflow-hidden border border-outline-variant/20">
<button class="flex-1 bg-secondary-container text-on-secondary-container font-button-text text-button-text py-sm px-md transition-colors text-center border-r border-outline-variant/20">Xếp hạng</button>
<button class="flex-1 bg-surface-container-lowest hover:bg-surface-container-high text-on-surface-variant font-button-text text-button-text py-sm px-md transition-colors text-center">Giao hữu</button>
</div>
</div>
</div>
</div>
<hr class="border-outline-variant/20"/>
<!-- Section: Board Settings -->
<div class="flex flex-col gap-md">
<div class="flex items-center gap-sm">
<span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">grid_4x4</span>
<h2 class="font-label-caps text-label-caps text-on-surface-variant uppercase">Bàn cờ</h2>
</div>
<div class="flex flex-col gap-xs">
<label class="font-body-sm text-body-sm text-on-surface-variant mb-xs">Kích thước</label>
<div class="grid grid-cols-3 gap-md">
<!-- 19x19 -->
<label class="relative flex flex-col items-center p-md rounded-lg border-2 border-primary bg-surface-container-low cursor-pointer transition-all hover:bg-surface-container-high">
<input checked="" class="sr-only" name="board_size" type="radio" value="19"/>
<span class="material-symbols-outlined text-primary mb-sm" style="font-size: 32px;">apps</span>
<span class="font-button-text text-button-text text-primary">19x19</span>
<span class="font-body-sm text-body-sm text-on-surface-variant text-center mt-xs">Tiêu chuẩn</span>
<div class="absolute top-sm right-sm w-4 h-4 rounded-full bg-primary flex items-center justify-center">
<span class="material-symbols-outlined text-on-primary" style="font-size: 12px; font-variation-settings: 'FILL' 1;">check</span>
</div>
</label>
<!-- 13x13 -->
<label class="relative flex flex-col items-center p-md rounded-lg border border-outline-variant/30 bg-surface-container-lowest cursor-pointer transition-all hover:bg-surface-container-high hover:border-outline-variant">
<input class="sr-only" name="board_size" type="radio" value="13"/>
<span class="material-symbols-outlined text-on-surface-variant mb-sm" style="font-size: 32px;">apps</span>
<span class="font-button-text text-button-text text-on-surface">13x13</span>
<span class="font-body-sm text-body-sm text-on-surface-variant text-center mt-xs">Nhanh</span>
</label>
<!-- 9x9 -->
<label class="relative flex flex-col items-center p-md rounded-lg border border-outline-variant/30 bg-surface-container-lowest cursor-pointer transition-all hover:bg-surface-container-high hover:border-outline-variant">
<input class="sr-only" name="board_size" type="radio" value="9"/>
<span class="material-symbols-outlined text-on-surface-variant mb-sm" style="font-size: 32px;">apps</span>
<span class="font-button-text text-button-text text-on-surface">9x9</span>
<span class="font-body-sm text-body-sm text-on-surface-variant text-center mt-xs">Tập sự</span>
</label>
</div>
</div>
</div>
<hr class="border-outline-variant/20"/>
<!-- Section: Time Controls -->
<div class="flex flex-col gap-md">
<div class="flex items-center gap-sm">
<span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">timer</span>
<h2 class="font-label-caps text-label-caps text-on-surface-variant uppercase">Thời gian</h2>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 gap-lg">
<!-- Main Time -->
<div class="flex flex-col gap-xs">
<label class="font-body-sm text-body-sm text-on-surface-variant" for="main_time">Thời gian chính</label>
<select class="bg-surface-container-lowest border-0 border-b border-outline-variant text-primary focus:ring-0 focus:border-primary transition-colors px-0 py-sm font-body-main text-body-main cursor-pointer" id="main_time">
<option value="10">10 phút</option>
<option value="20">20 phút</option>
<option selected="" value="30">30 phút</option>
<option value="60">60 phút</option>
<option value="0">Không giới hạn</option>
</select>
</div>
<!-- Byo-yomi -->
<div class="flex flex-col gap-xs">
<label class="font-body-sm text-body-sm text-on-surface-variant" for="byo_yomi">Byo-yomi (Thời gian phụ)</label>
<select class="bg-surface-container-lowest border-0 border-b border-outline-variant text-primary focus:ring-0 focus:border-primary transition-colors px-0 py-sm font-body-main text-body-main cursor-pointer" id="byo_yomi">
<option selected="" value="3x30">3 lần x 30 giây</option>
<option value="5x30">5 lần x 30 giây</option>
<option value="3x60">3 lần x 60 giây</option>
<option value="none">Không có</option>
</select>
</div>
</div>
</div>
<hr class="border-outline-variant/20"/>
<!-- Section: Security -->
<div class="flex flex-col gap-md">
<div class="flex items-center gap-sm">
<span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">lock</span>
<h2 class="font-label-caps text-label-caps text-on-surface-variant uppercase">Bảo mật</h2>
</div>
<div class="flex flex-col gap-xs">
<label class="font-body-sm text-body-sm text-on-surface-variant" for="room_password">Mật khẩu phòng (Tùy chọn)</label>
<input class="bg-surface-container-lowest border-0 border-b border-outline-variant text-primary focus:ring-0 focus:border-primary transition-colors px-0 py-sm font-body-main text-body-main placeholder-outline-variant max-w-sm" id="room_password" placeholder="Để trống nếu phòng mở" type="password"/>
</div>
</div>
</div>
<!-- Footer / Actions -->
<div class="px-margin py-lg border-t border-outline-variant/20 bg-surface-container-low flex justify-end gap-md">
<button class="px-lg py-sm rounded-lg font-button-text text-button-text text-on-surface-variant hover:bg-surface-container-high transition-colors border border-outline-variant/30">Hủy</button>
<button class="px-lg py-sm rounded-lg font-button-text text-button-text bg-primary text-on-primary hover:bg-primary/90 transition-colors shadow-sm flex items-center gap-xs" onclick="window.location.href='${pageContext.request.contextPath}/create-room'">
<span class="material-symbols-outlined text-[18px]">add</span>
                Tạo phòng
            </button>
</div>
</div>
</body></html>