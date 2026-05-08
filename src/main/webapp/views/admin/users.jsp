<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý người dùng - Admin Tâm Thế</title>
  <meta name="description" content="Quản lý tài khoản người dùng hệ thống cờ vây Tâm Thế">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
  <style>
    .user-avatar-sm {
      width: 32px; height: 32px; border-radius: 50%;
      background: linear-gradient(135deg, var(--color-primary-container), var(--color-secondary));
      display: flex; align-items: center; justify-content: center;
      font-size: 13px; font-weight: 600; color: white; flex-shrink: 0;
    }
    .user-info-cell { display: flex; align-items: center; gap: var(--space-sm); }
    .user-name { font-weight: 500; font-size: 14px; }
    .user-email { font-size: 12px; color: var(--color-on-surface-variant); }
    .rank-chip {
      display: inline-flex; align-items: center; gap: 4px;
      padding: 3px 10px; border-radius: var(--radius-full);
      font-size: 12px; font-weight: 600;
      background: rgba(210,180,140,0.15); color: var(--color-secondary);
    }
    .action-btns { display: flex; gap: var(--space-xs); }
    .btn-icon {
      width: 30px; height: 30px; border-radius: var(--radius);
      border: 1px solid var(--color-outline-variant);
      background: transparent; cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      color: var(--color-on-surface-variant);
      transition: all var(--transition-fast);
    }
    .btn-icon:hover { background: var(--color-surface-container); color: var(--color-on-surface); }
    .btn-icon.danger:hover { background: var(--color-error-container); color: var(--color-error); border-color: var(--color-error); }
    .modal-overlay { position: fixed; inset: 0; background: rgba(26,42,58,0.45); backdrop-filter: blur(4px); z-index: 999; display: none; align-items: center; justify-content: center; }
    .modal-overlay.show { display: flex; }
    .modal { background: var(--color-surface-container-lowest); border-radius: var(--radius-xl); padding: var(--space-xl); max-width: 500px; width: 90%; box-shadow: var(--shadow-xl); }
    .modal-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: var(--space-lg); }
    .modal-title { font-size: 18px; font-weight: 600; }
    .modal-close { background: none; border: none; cursor: pointer; color: var(--color-on-surface-variant); padding: 4px; border-radius: 4px; }
    .modal-close:hover { color: var(--color-on-surface); background: var(--color-surface-container); }
    .modal-form { display: flex; flex-direction: column; gap: var(--space-md); }
    .modal-footer { display: flex; gap: var(--space-sm); justify-content: flex-end; margin-top: var(--space-lg); }
    .table-info { font-size: var(--font-size-body-sm); color: var(--color-on-surface-variant); padding: var(--space-md); }
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
        <a href="${pageContext.request.contextPath}/admin/users" class="nav-item active">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
          Người dùng
        </a>
        <a href="${pageContext.request.contextPath}/admin/games" class="nav-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><line x1="3" y1="9" x2="21" y2="9"/><line x1="3" y1="15" x2="21" y2="15"/><line x1="9" y1="3" x2="9" y2="21"/><line x1="15" y1="3" x2="15" y2="21"/></svg>
          Ván đấu
        </a>
      </div>
      <div class="nav-section">
        <div class="nav-section-label">Cài đặt</div>
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
        <div class="topbar-title">Quản lý người dùng</div>
        <div class="topbar-breadcrumb">Admin › Người dùng</div>
      </div>
      <button class="btn btn-primary btn-sm" onclick="document.getElementById('addUserModal').classList.add('show')">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Thêm người dùng
      </button>
    </div>

    <div class="page-body">
      <!-- Stat Cards -->
      <div class="stat-grid" style="grid-template-columns: repeat(4, 1fr); margin-bottom: var(--space-lg);">
        <div class="stat-card">
          <div class="stat-icon">👥</div>
          <div class="stat-value">${totalUsers != null ? totalUsers : '1,248'}</div>
          <div class="stat-label">Tổng số</div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">✅</div>
          <div class="stat-value">${activeUsers != null ? activeUsers : '1,186'}</div>
          <div class="stat-label">Đang hoạt động</div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">🔒</div>
          <div class="stat-value">${bannedUsers != null ? bannedUsers : '14'}</div>
          <div class="stat-label">Đã khóa</div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">🆕</div>
          <div class="stat-value">${newUsers != null ? newUsers : '48'}</div>
          <div class="stat-label">Mới tháng này</div>
        </div>
      </div>

      <!-- Filter Bar -->
      <div class="filter-bar">
        <div class="search-input" style="flex:1;position:relative;">
          <svg style="position:absolute;left:12px;top:50%;transform:translateY(-50%);width:16px;height:16px;color:var(--color-outline);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          <input class="form-input" style="padding-left:40px;" type="text" id="searchUser" placeholder="Tìm theo tên, email..." oninput="filterTable()">
        </div>
        <select class="form-input form-select" style="width:160px;" id="filterStatus" onchange="filterTable()">
          <option value="">Tất cả trạng thái</option>
          <option value="active">Đang hoạt động</option>
          <option value="banned">Đã khóa</option>
        </select>
        <select class="form-input form-select" style="width:140px;" id="filterRole" onchange="filterTable()">
          <option value="">Tất cả vai trò</option>
          <option value="user">Người dùng</option>
          <option value="admin">Admin</option>
        </select>
      </div>

      <!-- Table -->
      <div class="table-wrapper">
        <div class="table-info flex-between">
          <span id="tableInfo">Hiển thị 1-10 trong tổng số ${totalUsers != null ? totalUsers : '1,248'} người dùng</span>
        </div>
        <table class="data-table" id="usersTable">
          <thead>
            <tr>
              <th>Người dùng</th>
              <th>Cấp độ</th>
              <th>ELO</th>
              <th>Ván đã chơi</th>
              <th>Trạng thái</th>
              <th>Ngày tham gia</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody id="usersTableBody">
            <c:choose>
              <c:when test="${not empty userList}">
                <c:forEach items="${userList}" var="u">
                  <tr data-status="${u.status}" data-role="${u.role}">
                    <td>
                      <div class="user-info-cell">
                        <div class="user-avatar-sm">${u.fullName.charAt(0)}</div>
                        <div>
                          <div class="user-name">${u.fullName}</div>
                          <div class="user-email">${u.email}</div>
                        </div>
                      </div>
                    </td>
                    <td><span class="rank-chip">${u.rank}</span></td>
                    <td><strong>${u.elo}</strong></td>
                    <td>${u.gamesPlayed}</td>
                    <td>
                      <c:choose>
                        <c:when test="${u.status eq 'active'}"><span class="badge badge-success">● Hoạt động</span></c:when>
                        <c:when test="${u.status eq 'banned'}"><span class="badge badge-error">● Bị khóa</span></c:when>
                        <c:otherwise><span class="badge badge-navy">${u.status}</span></c:otherwise>
                      </c:choose>
                    </td>
                    <td>${u.joinDate}</td>
                    <td>
                      <div class="action-btns">
                        <button class="btn-icon" title="Xem hồ sơ" onclick="window.location='${pageContext.request.contextPath}/user/${u.id}/profile'">
                          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                        </button>
                        <button class="btn-icon" title="Chỉnh sửa" onclick="openEditModal(${u.id})">
                          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                        </button>
                        <button class="btn-icon danger" title="Khóa tài khoản" onclick="confirmBan(${u.id}, '${u.fullName}')">
                          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="4.93" y1="4.93" x2="19.07" y2="19.07"/></svg>
                        </button>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <!-- Sample data -->
                <tr data-status="active" data-role="user">
                  <td><div class="user-info-cell"><div class="user-avatar-sm">N</div><div><div class="user-name">Nguyễn Văn An</div><div class="user-email">an.nguyen@email.com</div></div></div></td>
                  <td><span class="rank-chip">3 đẳng</span></td>
                  <td><strong>1,842</strong></td>
                  <td>234</td>
                  <td><span class="badge badge-success">● Hoạt động</span></td>
                  <td>12/01/2024</td>
                  <td><div class="action-btns">
                    <button class="btn-icon" title="Xem"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></button>
                    <button class="btn-icon" title="Sửa"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg></button>
                    <button class="btn-icon danger" title="Khóa"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="4.93" y1="4.93" x2="19.07" y2="19.07"/></svg></button>
                  </div></td>
                </tr>
                <tr data-status="active" data-role="user">
                  <td><div class="user-info-cell"><div class="user-avatar-sm">T</div><div><div class="user-name">Trần Thị Bình</div><div class="user-email">binh.tran@email.com</div></div></div></td>
                  <td><span class="rank-chip">1 đẳng</span></td>
                  <td><strong>1,560</strong></td>
                  <td>178</td>
                  <td><span class="badge badge-success">● Hoạt động</span></td>
                  <td>03/03/2024</td>
                  <td><div class="action-btns">
                    <button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></button>
                    <button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg></button>
                    <button class="btn-icon danger"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="4.93" y1="4.93" x2="19.07" y2="19.07"/></svg></button>
                  </div></td>
                </tr>
                <tr data-status="banned" data-role="user">
                  <td><div class="user-info-cell"><div class="user-avatar-sm" style="background:linear-gradient(135deg,#ba1a1a,#e85d04);">S</div><div><div class="user-name">SpamUser123</div><div class="user-email">spam@email.com</div></div></div></td>
                  <td><span class="rank-chip">18 kyu</span></td>
                  <td><strong>820</strong></td>
                  <td>12</td>
                  <td><span class="badge badge-error">● Bị khóa</span></td>
                  <td>28/04/2025</td>
                  <td><div class="action-btns">
                    <button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></button>
                    <button class="btn-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg></button>
                    <button class="btn-icon danger"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="4.93" y1="4.93" x2="19.07" y2="19.07"/></svg></button>
                  </div></td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
        <!-- Pagination -->
        <div class="pagination">
          <button class="page-btn">←</button>
          <button class="page-btn active">1</button>
          <button class="page-btn">2</button>
          <button class="page-btn">3</button>
          <span style="color:var(--color-outline);padding:0 4px;">...</span>
          <button class="page-btn">125</button>
          <button class="page-btn">→</button>
        </div>
      </div>
    </div>
  </main>
</div>

<!-- Add User Modal -->
<div class="modal-overlay" id="addUserModal">
  <div class="modal">
    <div class="modal-header">
      <div class="modal-title">Thêm người dùng mới</div>
      <button class="modal-close" onclick="document.getElementById('addUserModal').classList.remove('show')">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <form class="modal-form" action="${pageContext.request.contextPath}/admin/users/create" method="post">
      <div class="form-group">
        <label class="form-label">Họ và tên</label>
        <input class="form-input" type="text" name="fullName" placeholder="Nguyễn Văn A" required>
      </div>
      <div class="form-group">
        <label class="form-label">Tên đăng nhập</label>
        <input class="form-input" type="text" name="username" placeholder="nguyen_van_a" required>
      </div>
      <div class="form-group">
        <label class="form-label">Email</label>
        <input class="form-input" type="email" name="email" placeholder="email@example.com" required>
      </div>
      <div class="form-group">
        <label class="form-label">Vai trò</label>
        <select class="form-input form-select" name="role">
          <option value="user">Người dùng</option>
          <option value="admin">Admin</option>
        </select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('addUserModal').classList.remove('show')">Hủy</button>
        <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
      </div>
    </form>
  </div>
</div>

<script>
  function filterTable() {
    const search = document.getElementById('searchUser').value.toLowerCase();
    const status = document.getElementById('filterStatus').value;
    const role = document.getElementById('filterRole').value;
    const rows = document.querySelectorAll('#usersTableBody tr');
    rows.forEach(row => {
      const text = row.textContent.toLowerCase();
      const rowStatus = row.dataset.status || '';
      const rowRole = row.dataset.role || '';
      const show = text.includes(search) &&
        (!status || rowStatus === status) &&
        (!role || rowRole === role);
      row.style.display = show ? '' : 'none';
    });
  }
</script>
</body>
</html>
