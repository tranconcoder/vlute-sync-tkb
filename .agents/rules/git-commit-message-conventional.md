---
trigger: model_decision
description: # Conventional Commits Rules  > Hướng dẫn viết commit message đúng chuẩn [Conventional Commits v1.0.0]
---

# Conventional Commits Rules

> Hướng dẫn viết commit message đúng chuẩn [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)

---

## Cấu trúc bắt buộc

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

---

## Types hợp lệ

| Type | Ý nghĩa | SemVer |
|---|---|---|
| `feat` | Thêm tính năng mới | MINOR |
| `fix` | Sửa bug | PATCH |
| `docs` | Thay đổi tài liệu | - |
| `style` | Format code, không thay đổi logic | - |
| `refactor` | Tái cấu trúc code, không fix bug, không thêm feature | - |
| `perf` | Cải thiện hiệu suất | - |
| `test` | Thêm hoặc sửa test | - |
| `build` | Thay đổi build system, dependencies | - |
| `ci` | Thay đổi CI/CD config | - |
| `chore` | Công việc lặt vặt, không ảnh hưởng src/test | - |
| `revert` | Revert commit trước | - |

---

## Rules bắt buộc

### 1. Type
- PHẢI có type ở đầu commit
- Type PHẢI viết thường (lowercase)
- PHẢI có dấu `:` và space sau type/scope

```
✅ feat: add login page
❌ Feat: add login page
❌ FEAT: add login page
❌ feat add login page
```

### 2. Description
- PHẢI có description ngay sau `type: `
- Viết thường, không viết hoa chữ đầu
- Không có dấu `.` ở cuối
- Ngắn gọn, rõ ràng, dưới 72 ký tự
- Dùng thì hiện tại (imperative mood): "add" không phải "added" hay "adds"

```
✅ feat: add user authentication
❌ feat: Added user authentication
❌ feat: adds user authentication
❌ feat: Add user authentication.
```

### 3. Scope (tùy chọn)
- Đặt trong ngoặc đơn sau type
- Mô tả phần code bị ảnh hưởng
- Viết thường

```
✅ feat(auth): add JWT middleware
✅ fix(api): handle null response
❌ feat(Auth): add JWT middleware
```

### 4. Body (tùy chọn)
- Cách description 1 dòng trống
- Giải thích **tại sao** thay đổi, không phải **làm gì**
- Mỗi dòng không quá 72 ký tự

```
fix: prevent racing of requests

Introduce a request id and a reference to latest request.
Dismiss incoming responses other than from latest request.
```

### 5. Footer (tùy chọn)
- Cách body 1 dòng trống
- Dùng cho: breaking change, issue reference, reviewer

```
feat: allow config to extend other configs

BREAKING CHANGE: `extends` key now used for extending config files
Refs: #123
Reviewed-by: Nam
```

---

## Breaking Changes

Có 2 cách khai báo breaking change:

**Cách 1: Dùng `!` sau type/scope**
```
feat!: remove deprecated API endpoints
feat(api)!: change response format
```

**Cách 2: Dùng footer `BREAKING CHANGE:`**
```
feat: update authentication flow

BREAKING CHANGE: JWT token format has changed, clients must update
```

**Cách 3: Kết hợp cả hai**
```
chore!: drop support for Node 14

BREAKING CHANGE: use ES2022 features not available in Node 14
```

---

## Ví dụ thực tế

```bash
# Thêm tính năng
feat: add google calendar sync
feat(auth): implement SSO login
feat(api)!: change pagination format

# Sửa bug
fix: resolve redis connection timeout
fix(parser): handle empty array input

# Tài liệu
docs: update README with setup guide
docs(api): add endpoint documentation

# Refactor
refactor: extract redis client to separate module
refactor(auth): simplify token validation logic

# CI/CD
ci: add docker build cache
ci(gitlab): fix runner configuration

# Chore
chore: update dependencies
chore: remove unused files

# Revert
revert: feat(auth): add SSO login

Refs: abc1234
```

---

## Những lỗi thường gặp

```bash
# ❌ Không có type
git commit -m "fix login bug"

# ❌ Type sai
git commit -m "fixed: login bug"
git commit -m "fix : login bug"   # có space trước dấu :

# ❌ Description viết hoa
git commit -m "feat: Add login page"

# ❌ Description có dấu chấm
git commit -m "fix: resolve null pointer."

# ❌ Dùng thì quá khứ
git commit -m "feat: added login page"

# ❌ Quá chung chung
git commit -m "fix: bug fix"
git commit -m "chore: update"
git commit -m "feat: changes"
```

---

## Checklist trước khi commit

- [ ] Có type hợp lệ
- [ ] Type viết thường
- [ ] Có dấu `:` và space sau type
- [ ] Description viết thường, không dấu chấm cuối
- [ ] Description dùng thì hiện tại
- [ ] Description rõ ràng, đủ nghĩa
- [ ] Nếu breaking change → có `!` hoặc footer `BREAKING CHANGE:`
- [ ] Nếu có body → cách description 1 dòng trống