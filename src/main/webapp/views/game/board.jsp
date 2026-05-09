<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<% request.setAttribute("activeTab", "game"); %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Cờ Vây System - Trận Đấu</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
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
                        "gt-primary": "#041525",
                        "gt-wood": "#e1c299",
                        "gt-wood-dark": "#8b7355",
                        "gt-stone-black": "#111111",
                        "gt-stone-white": "#fcfcfc",
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
    <style>
        /* Cô lập CSS cho vùng Game */
        #gt-game-root .gt-goban {
            background-color: theme('colors.gt-wood');
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.8' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100' height='100' filter='url(%23noise)' opacity='0.08'/%3E%3C/svg%3E");
            box-shadow: inset 0 0 80px rgba(0,0,0,0.1), 0 15px 30px rgba(0,0,0,0.2);
            border-bottom: 6px solid theme('colors.gt-wood-dark');
            border-right: 6px solid theme('colors.gt-wood-dark');
        }

        #gt-game-root .gt-grid-line {
            background-color: rgba(4, 21, 37, 0.35);
            position: absolute;
        }

        #gt-game-root .gt-hoshi {
            background-color: rgba(4, 21, 37, 0.7);
            position: absolute;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            transform: translate(-50%, -50%);
        }

        /* Tránh xung đột với Sidebar chính */
        .gt-info-sidebar {
            width: 320px;
            flex-shrink: 0;
            border-left: 1px solid rgba(0,0,0,0.05);
        }

        .gt-stone {
            position: absolute;
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: all 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            z-index: 10;
        }
    </style>
</head>
<body class="bg-background font-body-main flex h-screen overflow-hidden antialiased">

<jsp:include page="/views/layout/user-sidebar.jsp" />

<div id="gt-game-root" class="flex-1 flex flex-col min-w-0 bg-background relative">

    <header class="h-[64px] bg-white flex justify-between items-center px-6 border-b border-outline-variant/20 shrink-0 z-20">
        <div class="flex items-center gap-4">
            <h2 class="text-xl font-bold text-gt-primary line-clamp-1">${currentGame.roomName}</h2>
            <span class="px-2 py-0.5 bg-surface-container text-on-surface-variant text-[10px] font-bold rounded uppercase">
                    Bàn ${currentGame.boardSize}x${currentGame.boardSize}
                </span>
        </div>
        <div class="flex items-center gap-4 text-on-surface-variant text-sm">
            <span>Phòng: #${currentGame.id}</span>
            <button class="hover:text-gt-primary p-2 rounded-full hover:bg-surface-container transition-colors" onclick="location.href='${pageContext.request.contextPath}/lobby'">
                <span class="material-symbols-outlined">close</span>
            </button>
        </div>
    </header>

    <main class="flex-1 flex flex-row overflow-hidden">

        <section class="flex-1 flex flex-col items-center justify-center p-8 min-w-0 relative">
            <div class="mb-6 px-4 py-2 bg-white rounded-full shadow-sm border border-outline-variant/10 flex items-center gap-3">
                <span id="gt-turn-dot" class="w-2.5 h-2.5 rounded-full bg-gt-primary animate-pulse"></span>
                <span id="gt-turn-text" class="text-sm font-medium">Đang kết nối WebSocket...</span>
            </div>

            <div id="gt-goban-container" class="gt-goban relative aspect-square w-full max-w-[700px] max-h-full rounded-sm">
                <div id="gt-grid-layer" class="absolute inset-[5%] pointer-events-none"></div>
                <div id="gt-stones-layer" class="absolute inset-[5%] pointer-events-none"></div>
                <div id="gt-interaction-layer" class="absolute inset-[5%] cursor-crosshair"></div>
            </div>

            <div class="w-full max-w-[700px] flex justify-between items-center mt-6">
                <div class="flex gap-3">
                    <button id="btn-resign" class="px-4 py-2 bg-white border border-outline-variant/30 rounded-lg text-sm hover:bg-surface-container transition-colors">Đầu hàng</button>
                    <button id="btn-pass" class="px-4 py-2 bg-white border border-outline-variant/30 rounded-lg text-sm hover:bg-surface-container transition-colors">Bỏ lượt</button>
                </div>
                <div id="gt-coords" class="text-xs font-mono text-on-surface-variant opacity-40">Tọa độ: --</div>
            </div>
        </section>

        <aside class="gt-info-sidebar bg-surface-container-lowest flex flex-col p-6 gap-6 overflow-y-auto">
            <c:set var="isBlack" value="${sessionScope.user eq currentGame.blackPlayer.username}" />
            <c:set var="opponent" value="${isBlack ? currentGame.whitePlayer : currentGame.blackPlayer}" />

            <div class="bg-white rounded-xl p-4 border border-outline-variant/10 shadow-sm border-t-4 border-gt-wood-dark">
                <div class="flex items-center gap-4">
                    <div class="w-12 h-12 rounded-full bg-gt-primary text-white flex items-center justify-center font-bold text-xl">
                        ${opponent != null ? opponent.fullName.charAt(0) : '?'}
                    </div>
                    <div class="flex-1">
                        <h3 class="font-bold text-gt-primary truncate">${opponent != null ? opponent.fullName : "Chờ đối thủ..."}</h3>
                        <div class="flex items-center gap-2 mt-1 text-xs text-on-surface-variant">
                            <span class="w-2 h-2 rounded-full ${isBlack ? 'bg-white border' : 'bg-gt-stone-black'}"></span>
                            ${isBlack ? "Quân Trắng" : "Quân Đen"}
                            <span class="ml-auto opacity-60">${opponent != null ? opponent.rank : ""}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="flex-1 flex flex-col items-center justify-center opacity-20 pointer-events-none">
                <span class="material-symbols-outlined text-[64px]">grid_4x4</span>
            </div>

            <div class="bg-white rounded-xl p-4 border border-outline-variant/10 shadow-sm border-t-4 border-gt-primary">
                <div class="flex items-center gap-4">
                    <div class="w-12 h-12 rounded-full bg-gt-primary text-white flex items-center justify-center font-bold text-xl">
                        ${sessionScope.displayName.charAt(0)}
                    </div>
                    <div class="flex-1">
                        <h3 class="font-bold text-gt-primary truncate">${sessionScope.displayName} (Bạn)</h3>
                        <div class="flex items-center gap-2 mt-1 text-xs text-on-surface-variant">
                            <span class="w-2 h-2 rounded-full ${isBlack ? 'bg-gt-stone-black' : 'bg-white border'}"></span>
                            ${isBlack ? "Quân Đen" : "Quân Trắng"}
                        </div>
                    </div>
                </div>
            </div>
        </aside>
    </main>
</div>

<script>
    const config = {
        id: "${currentGame.id}",
        size: ${currentGame.boardSize},
        role: ("${sessionScope.user}" === "${currentGame.blackPlayer.username}") ? "black" : "white",
        spacing: 100 / (${currentGame.boardSize} - 1)
    };

    let currentTurn = "black";
    let totalStones = 0;
    const ws = new WebSocket("ws://" + window.location.host + "${pageContext.request.contextPath}/ws/game/" + config.id);

    ws.onmessage = (e) => {
        const data = JSON.parse(e.data);

        if (data.type === "INVALID_MOVE") {
            alert(data.data); // Hiển thị lỗi Tự sát hoặc Ko
            return;
        }

        if (data.type === "REMOVE") {
            data.data.forEach(stone => {
                const el = document.querySelector(`[data-pos="\${stone.x}-\${stone.y}"]`);
                if (el) {
                    el.classList.add('scale-0');
                    setTimeout(() => {
                        el.remove();
                        totalStones--;
                        calculateTurn();
                    }, 200);
                }
            });
        } else {
            if (data.isHistory || data.color !== config.role) {
                addStoneToUI(data.x, data.y, data.color);
            }
        }
    };

    function addStoneToUI(x, y, color) {
        if (document.querySelector(`[data-pos="\${x}-\${y}"]`)) return false;

        const layer = document.getElementById('gt-stones-layer');
        const stone = document.createElement('div');
        const stoneSize = (config.size === 19) ? 5.2 : 7.5;

        stone.className = "gt-stone shadow-lg";
        stone.setAttribute('data-pos', `\${x}-\${y}`);
        stone.style.width = stoneSize + "%"; stone.style.height = stoneSize + "%";
        stone.style.left = (x * config.spacing) + "%";
        stone.style.top = (y * config.spacing) + "%";

        stone.style.background = (color === 'black') ?
            "radial-gradient(circle at 35% 35%, #444, #111)" :
            "radial-gradient(circle at 35% 35%, #fff, #ddd)";
        if (color === 'white') stone.style.border = "1px solid rgba(0,0,0,0.15)";

        layer.appendChild(stone);
        totalStones++;
        calculateTurn();
        return true;
    }

    function calculateTurn() {
        currentTurn = (totalStones % 2 === 0) ? "black" : "white";
        updateTurnUI();
    }

    function updateTurnUI() {
        const isMyTurn = (currentTurn === config.role);
        const text = document.getElementById('gt-turn-text');
        const dot = document.getElementById('gt-turn-dot');

        text.innerText = isMyTurn ? "Lượt của bạn (\${config.role === 'black' ? 'Đen' : 'Trắng'})" : "Đang chờ đối thủ...";
        dot.className = "w-2.5 h-2.5 rounded-full " + (isMyTurn ? "bg-green-500 animate-pulse" : "bg-gt-primary opacity-40");
        document.getElementById('gt-interaction-layer').style.cursor = isMyTurn ? "crosshair" : "not-allowed";
    }

    document.getElementById('gt-interaction-layer').addEventListener('click', (e) => {
        if (currentTurn !== config.role) return;

        const r = e.currentTarget.getBoundingClientRect();
        const x = Math.round(((e.clientX - r.left) / r.width) * (config.size - 1));
        const y = Math.round(((e.clientY - r.top) / r.height) * (config.size - 1));

        if (!document.querySelector(`[data-pos="\${x}-\${y}"]`)) {
            // Chỉ gửi lệnh đi, Server sẽ kiểm tra tính hợp lệ
            ws.send(JSON.stringify({ x: x, y: y, color: config.role }));
            // Lưu ý: Không vẽ ngay ở đây để đợi Server xác nhận (hoặc vẽ nháp rồi xóa nếu sai)
            // Ở đây ta chọn vẽ nháp để mượt mà:
            if(addStoneToUI(x, y, config.role)) {
                // Nếu server báo INVALID_MOVE, ta sẽ xóa sau trong onmessage
            }
        }
    });

    window.onload = () => {
        const grid = document.getElementById('gt-grid-layer');
        for (let i = 0; i < config.size; i++) {
            const p = i * config.spacing;
            const h = document.createElement('div'); h.className="gt-grid-line w-full h-[1px]"; h.style.top=p+"%"; grid.appendChild(h);
            const v = document.createElement('div'); v.className="gt-grid-line h-full w-[1px]"; v.style.left=p+"%"; grid.appendChild(v);
        }
        calculateTurn();
    };
</script>
</body>
</html>