<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý ván đấu - Admin Tâm Thế</title>
  <meta name="description" content="Quản lý tất cả ván đấu cờ vây trong hệ thống Tâm Thế">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
  <style>
    .player-pair {
      display: flex; align-items: center; gap: var(--space-sm);
    }
    .stone-icon {
      width: 18px; height: 18px; border-radius: 50%; flex-shrink: 0;
    }
    .stone-icon.black { background: radial-gradient(circle at 35% 35%, #555, #111); box-shadow: 0 1px 3px rgba(0,0,0,0.4); }
    .stone-icon.white { background: radial-gradient(circle at 35% 35%, #fff, #ddd); border: 1px solid rgba(0,0,0,0.15); }
    .vs-label { font-size: 10px; color: var(--color-on-surface-variant); font-weight: 600; }
    .board-size-chip {
      display: inline-block; padding: 2px 8px;
      background: var(--color-surface-container);
      border-radius: var(--radius-full);
      font-size: 11px; font-weight: 600; color: var(--color-on-surface-variant);
    }
    .btn-icon {
      width: 30px; height: 30px; border-radius: var(--radius);
      border: 1px solid var(--color-outline-variant); background: transparent;
      cursor: pointer; display: flex; align-items: center; justify-content: center;
      color: var(--color-on-surface-variant); transition: all var(--transition-fast);
    }
    .btn-icon:hover { background: var(--color-surface-container); color: var(--color-on-surface); }
    .btn-icon.danger:hover { background: var(--color-error-container); color: var(--color-error); border-color: var(--color-error); }
    .action-btns { display: flex; gap: var(--space-xs); }
    .live-indicator {
      display: inline-flex; align-items: center; gap: 5px;
      font-size: 12px; font-weight: 500; color: #155724;
    }
    .live-dot {
      width: 7px; height: 7px; border-radius: 50%;
      background: #28a745; animation: blink 1.5s infinite;
    }
    @keyframes blink { 0%,100%{opacity:1;} 50%{opacity:0.3;} }
    .tab-bar {
      display: flex; gap: var(--space-xs);
      background: var(--color-surface-container);
      padding: 4px; border-radius: var(--radius-md);
      margin-bottom: var(--space-lg);
      width: fit-content;
    }
    .tab-btn {
      padding: 8px 20px; border: none; border-radius: var(--radius);
      background: transparent; font-family: var(--font-family);
      font-size: var(--font-size-body-sm); font-weight: 500;
      color: var(--color-on-surface-variant); cursor: pointer;
      transition: all var(--transition-fast);
    }
    .tab-btn.active {
      background: var(--color-surface-container-lowest);
      color: var(--color-on-surface);
      box-shadow: var(--shadow-sm);
    }
  </style>
</head>
<body>
<div class="layout-wrapper">
  <!-- Sidebar -->
  <aside class="sidebar">
    <div class="sidebar-brand">
      <div class="sidebar-logo">⬡</div>
      <div class="sidebar-brand-text">
        <div class="sidebar-brand-name">Tâm Thế</div>
        <div class="sidebar-brand-sub">Admin Panel</div>
      </div>
    </div>
    <nav class="sidebar-nav">
      <div class="nav-section">
        <div class="nav-section-label">Tổng quan</div>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
          Dashboard
        </a>
      </div>
      <div class="nav-section">
        <div class="nav-section-label">Quản lý</div>
        <a href="${pageContext.request.contextPath}/admin/users" class="nav-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
          Người dùng
        </a>
        <a href="${pageContext.request.contextPath}/admin/games" class="nav-item active">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><line x1="3" y1="9" x2="21" y2="9"/><line x1="3" y1="15" x2="21" y2="15"/><line x1="9" y1="3" x2="9" y2="21"/><line x1="15" y1="3" x2="15" y2="21"/></svg>
          Ván đấu
        </a>
      </div>
      <div class="nav-section">
        <div class="nav-section-label">Hệ thống</div>
        <a href="${pageContext.request.contextPath}/logout" class="nav-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
          Đăng xuất
        </a>
      </div>
    </nav>
    <div class="sidebar-footer">
      <div class="sidebar-user">
        <div class="sidebar-avatar">A</div>
        <div><div class="sidebar-username">Admin</div><div class="sidebar-role">Quản trị viên</div></div>
      </div>
    </div>
  </aside>

  <!-- Main -->
  <main class="main-content">
    <div class="topbar">
      <div>
        <div class="topbar-title">Quản lý ván đấu</div>
        <div class="topbar-breadcrumb">Admin › Ván đấu</div>
      </div>
      <div class="flex gap-md">
        <button class="btn btn-secondary btn-sm">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Xuất dữ liệu
        </button>
      </div>
    </div>

    <div class="page-body">
      <!-- Stats -->
      <div class="stat-grid" style="grid-template-columns: repeat(4, 1fr); margin-bottom: var(--space-lg);">
        <div class="stat-card">
          <div class="stat-icon">♟</div>
          <div class="stat-value">${totalGames != null ? totalGames : '5,832'}</div>
          <div class="stat-label">Tổng ván đấu</div>
        </div>
        <div class="stat-card">
          <div class="stat-icon" style="font-size:16px;">🟢</div>
          <div class="stat-value" style="color:#155724;">${liveGames != null ? liveGames : '23'}</div>
          <div class="stat-label">Đang diễn ra</div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">⏱</div>
          <div class="stat-value">47'</div>
          <div class="stat-label">Thời gian TB</div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">📊</div>
          <div class="stat-value">52%</div>
          <div class="stat-label">Tỉ lệ thắng Đen</div>
        </div>
      </div>

      <!-- Tabs -->
      <div class="tab-bar">
        <button class="tab-btn active" onclick="switchTab('all',this)">Tất cả</button>
        <button class="tab-btn" onclick="switchTab('live',this)">
          <span class="live-indicator"><span class="live-dot"></span>Đang diễn ra</span>
        </button>
        <button class="tab-btn" onclick="switchTab('finished',this)">Đã kết thúc</button>
      </div>

      <!-- Filter Bar -->
      <div class="filter-bar">
        <div style="position:relative;flex:1;">
          <svg style="position:absolute;left:12px;top:50%;transform:translateY(-50%);width:16px;height:16px;color:var(--color-outline);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          <input class="form-input" style="padding-left:40px;" type="text" placeholder="Tìm theo người chơi, ID ván đấu...">
        </div>
        <select class="form-input form-select" style="width:140px;">
          <option>Kích thước bàn</option>
          <option>19×19</option>
          <option>13×13</option>
          <option>9×9</option>
        </select>
        <select class="form-input form-select" style="width:140px;">
          <option>Kết quả</option>
          <option>Đen thắng</option>
          <option>Trắng thắng</option>
          <option>Đang diễn ra</option>
        </select>
        <input class="form-input" type="date" style="width:150px;" title="Từ ngày">
      </div>

      <!-- Table -->
      <div class="table-wrapper">
        <table class="data-table" id="gamesTable">
          <thead>
            <tr>
              <th>ID</th>
              <th>Người chơi</th>
              <th>Bàn cờ</th>
              <th>Số nước</th>
              <th>Thời gian</th>
              <th>Trạng thái</th>
              <th>Kết quả</th>
              <th>Ngày</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty gameList}">
                <c:forEach items="${gameList}" var="g">
                  <tr>
                    <td><code style="font-size:12px;color:var(--color-on-surface-variant);">#${g.id}</code></td>
                    <td>
                      <div class="player-pair">
                        <div class="stone-icon black"></div>
                        <span style="font-size:13px;">${g.blackPlayer}</span>
                        <span class="vs-label">VS</span>
                        <div class="stone-icon white"></div>
                        <span style="font-size:13px;">${g.whitePlayer}</span>
                      </div>
                    </td>
                    <td><span class="board-size-chip">${g.boardSize}×${g.boardSize}</span></td>
                    <td>${g.moves}</td>
                    <td>${g.duration}</td>
                    <td>
                      <c:choose>
                        <c:when test="${g.status eq 'live'}"><span class="badge badge-success live-indicator"><span class="live-dot"></span>Live</span></c:when>
                        <c:when test="${g.status eq 'finished'}"><span class="badge badge-navy">Đã kết thúc</span></c:when>
                        <c:otherwise><span class="badge">${g.status}</span></c:otherwise>
                      </c:choose>
                    </td>
                    <td>${g.result}</td>
                    <td style="font-size:12px;color:var(--color-on-surface-variant);">${g.date}</td>
                    <td>
                      <div class="action-btns">
                        <button class="btn-icon" onclick="window.location='${pageContext.request.contextPath}/game/${g.id}'" title="Xem">
                          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                        </button>
                        <button class="btn-icon danger" title="Xóa">
                          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
                        </button>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <!-- Sample rows -->
                <tr>
                  <td><code style="font-size:12px;color:var(--color-on-surface-variant);">#1058</code></td>
                  <td><div class="player-pair"><div class="stone-icon black"></div><span style="font-size:13px;">NguyenVanA</span><span class="vs-label">VS</span><div class="stone-icon white"></div><span style="font-size:13px;">TranThiB</span></div></td>
                  <td><span class="board-size-chip">19×19</span></td>
                  <td>120</td><td>52 phút</td>
                  <td><span class="badge badge-navy">Đã kết thúc</span></td>
                  <td><span class="badge" style="background:rgba(26,42,58,0.08);color:var(--color-primary-container);">Đen thắng</span></td>
                  <td style="font-size:12px;color:var(--color-on-surface-variant);">07/05/2026</td>
                  <td><div class="action-btns"><button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></button><button class="btn-icon danger"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg></button></div></td>
                </tr>
                <tr>
                  <td><code style="font-size:12px;color:var(--color-on-surface-variant);">#1057</code></td>
                  <td><div class="player-pair"><div class="stone-icon black"></div><span style="font-size:13px;">LeVanC</span><span class="vs-label">VS</span><div class="stone-icon white"></div><span style="font-size:13px;">PhamThiD</span></div></td>
                  <td><span class="board-size-chip">19×19</span></td>
                  <td>94</td><td>38 phút</td>
                  <td><span class="badge badge-success live-indicator"><span class="live-dot"></span>Live</span></td>
                  <td><span class="badge badge-navy">Đang chơi</span></td>
                  <td style="font-size:12px;color:var(--color-on-surface-variant);">08/05/2026</td>
                  <td><div class="action-btns"><button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></button><button class="btn-icon danger"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg></button></div></td>
                </tr>
                <tr>
                  <td><code style="font-size:12px;color:var(--color-on-surface-variant);">#1056</code></td>
                  <td><div class="player-pair"><div class="stone-icon black"></div><span style="font-size:13px;">HoangVanE</span><span class="vs-label">VS</span><div class="stone-icon white"></div><span style="font-size:13px;">NguyenThiF</span></div></td>
                  <td><span class="board-size-chip">9×9</span></td>
                  <td>61</td><td>22 phút</td>
                  <td><span class="badge badge-navy">Đã kết thúc</span></td>
                  <td><span class="badge" style="background:rgba(210,180,140,0.15);color:var(--color-secondary);">Trắng thắng</span></td>
                  <td style="font-size:12px;color:var(--color-on-surface-variant);">07/05/2026</td>
                  <td><div class="action-btns"><button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></button><button class="btn-icon danger"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg></button></div></td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
        <div class="pagination">
          <button class="page-btn">←</button>
          <button class="page-btn active">1</button>
          <button class="page-btn">2</button>
          <button class="page-btn">3</button>
          <span style="color:var(--color-outline);padding:0 4px;">...</span>
          <button class="page-btn">584</button>
          <button class="page-btn">→</button>
        </div>
      </div>
    </div>
  </main>
</div>
<script>
  function switchTab(tab, btn) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
  }
</script>
</body>
</html>
