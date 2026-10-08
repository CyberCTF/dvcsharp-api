# Upstream

| | |
| --- | --- |
| Project | Damn Vulnerable C# Application (API only) |
| Repository | https://github.com/appsecco/dvcsharp-api |
| Version | master (no release tags) |
| Commit | 76c1de3c9d8d9c2e8ec0b50abe3b198a4330d7fc |
| Licence | MIT |

`build/web/app/` is that commit, unchanged, without its Git history. `build/web/Dockerfile` is
upstream's Dockerfile with one change: its base `microsoft/dotnet` is gone from Docker Hub, so it
builds from `mcr.microsoft.com/dotnet/core/sdk:2.1` (the project targets netcoreapp2.0, which
rolls forward to 2.1). Package versions are pinned in upstream's `.csproj`. The database is
SQLite in the container, created at build time by `dotnet ef database update`, as upstream does.
To update, replace `build/web/app/` with a newer commit, then change this table.
