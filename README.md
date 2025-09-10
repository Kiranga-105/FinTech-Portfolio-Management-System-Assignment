# Contacts Dashboard — Updated for PostgreSQL & Tests

## What I changed
- Replaced `sqlite3` with `pg` (PostgreSQL) in `Gemfile`.
- Updated `config/database.yml` to use PostgreSQL adapters and example database names.
- Added a small JavaScript file `app/assets/javascripts/custom_shortcodes.js` to provide a shortcode preview toggle.
- Added basic Minitest test files under `test/` for quick sanity checks.
- Expanded this README with setup steps and sample usage.

## Setup (development)
1. Install PostgreSQL and create databases:
   ```bash
   createdb contacts_dashboard_development
   createdb contacts_dashboard_test
   ```
   Or configure `PG_USERNAME` and `PG_PASSWORD` environment variables.

2. Install gems:
   ```bash
   bundle install
   ```

3. Run migrations:
   ```bash
   rails db:migrate
   rails db:seed
   ```

4. Run tests:
   ```bash
   rails test
   ```

## Notes & Assumptions
- I replaced sqlite3 with `pg` as required by the assignment. Ensure PostgreSQL server is running and accessible.
- The JS addition is intentionally minimal to satisfy the "some JS usage" requirement — it adds a toggle for shortcode previews; you can expand it.
- Tests included are basic/smoke tests to show test structure. Please expand to cover more cases (models, shortcode parsing, controllers) as needed.
