@echo off
REM The following variables are Base64 encoded strings for unrpyc and rpatool
REM Due to batch limitations on variable lengths, they need to be split into
REM multiple variables, and joined later using powershell.
REM --------------------------------------------------------------------------------
REM rpatool f2520ad - https://github.com/Shizmob/rpatool
REM --------------------------------------------------------------------------------
set rpatool1=IyEvdXNyL2Jpbi9lbnYgcHl0aG9uCgpmcm9tIF9fZnV0dXJlX18gaW1wb3J0IHByaW50X2Z1bmN0aW9uCgppbXBvcnQgc3lzCmltcG9ydCBvcwppbXBvcnQgY29kZWNzCmltcG9ydCBwaWNrbGUKaW1wb3J0IGVycm5vCmltcG9ydCByYW5kb20KCmlmIHN5cy52ZXJzaW9uX2luZm9bMF0gPj0gMzoKICAgIGRlZiBfdW5pY29kZSh0ZXh0KToKICAgICAgICByZXR1cm4gdGV4dAoKICAgIGRlZiBfcHJpbnRhYmxlKHRleHQpOgogICAgICAgIHJldHVybiB0ZXh0CgogICAgZGVmIF91bm1hbmdsZShkYXRhKToKICAgICAgICByZXR1cm4gZGF0YS5lbmNvZGUoJ2xhdGluMScpCgogICAgZGVmIF91bnBpY2tsZShkYXRhKToKICAgICAgICAjIFNwZWNpZnkgbGF0aW4xIGVuY29kaW5nIHRvIHByZXZlbnQgcmF3IGJ5dGUgdmFsdWVzIGZyb20gY2F1c2luZyBhbiBBU0NJSSBkZWNvZGUgZXJyb3IuCiAgICAgICAgcmV0dXJuIHBpY2tsZS5sb2FkcyhkYXRhLCBlbmNvZGluZz0nbGF0aW4xJykKZWxpZiBzeXMudmVyc2lvbl9pbmZvWzBdID09IDI6CiAgICBkZWYgX3VuaWNvZGUodGV4dCk6CiAgICAgICAgaWYgaXNpbnN0YW5jZSh0ZXh0LCB1bmljb2RlKToKICAgICAgICAgICAgcmV0dXJuIHRleHQKICAgICAgICByZXR1cm4gdGV4dC5kZWNvZGUoJ3V0Zi04JykKCiAgICBkZWYgX3ByaW50YWJsZSh0ZXh0KToKICAgICAgICByZXR1cm4gdGV4dC5lbmNvZGUoJ3V0Zi04JykKCiAgICBkZWYgX3VubWFuZ2xlKGRhdGEpOgogICAgICAgIHJldHVybiBkYXRhCgogICAgZGVmIF91bnBpY2tsZShkYXRhKToKICAgICAgICByZXR1cm4gcGlja2xlLmxvYWRzKGRhdGEpCgpjbGFzcyBSZW5QeUFyY2hpdmU6CiAgICBmaWxlID0gTm9uZQogICAgaGFuZGxlID0gTm9uZQoKICAgIGZpbGVzID0ge30KICAgIGluZGV4ZXMgPSB7fQoKICAgIHZlcnNpb24gPSBOb25lCiAgICBwYWRsZW5ndGggPSAwCiAgICBrZXkgPSBOb25lCiAgICB2ZXJib3NlID0gRmFsc2UKCiAgICBSUEEyX01BR0lDID0gJ1JQQS0yLjAgJwogICAgUlBBM19NQUdJQyA9ICdSUEEtMy4wICcKCiAgICAjIEZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCBvdGhlcndpc2UgUHl0aG9uMy1wYWNrZWQgYXJjaGl2ZXMgd29uJ3QgYmUgcmVhZCBieSBQeXRob24yCiAgICBQSUNLTEVfUFJPVE9DT0wgPSAyCgogICAgZGVmIF9faW5pdF9fKHNlbGYsIGZpbGUgPSBOb25lLCB2ZXJzaW9uID0gMywgcGFkbGVuZ3RoID0gMCwga2V5ID0gMHhERUFEQkVFRiwgdmVyYm9zZSA9IEZhbHNlKToKICAgICAgICBzZWxmLnBhZGxlbmd0aCA9IHBhZGxlbmd0aAogICAgICAgIHNlbGYua2V5ID0ga2V5CiAgICAgICAgc2VsZi52ZXJib3NlID0gdmVyYm9zZQoKICAgICAgICBpZiBmaWxlIGlzIG5vdCBOb25lOgogICAgICAgICAgICBzZWxmLmxvYWQoZmlsZSkKICAgICAgICBlbHNlOgogICAgICAgICAgICBzZWxmLnZlcnNpb24gPSB2ZXJzaW9uCgogICAgZGVmIF9fZGVsX18oc2VsZik6CiAgICAgICAgaWYgc2VsZi5oYW5kbGUgaXMgbm90IE5vbmU6CiAgICAgICAgICAgIHNlbGYuaGFuZGxlLmNsb3NlKCkKCiAgICAjIERldGVybWluZSBhcmNoaXZlIHZlcnNpb24uCiAgICBkZWYgZ2V0X3ZlcnNpb24oc2VsZik6CiAgICAgICAgc2VsZi5oYW5kbGUuc2VlaygwKQogICAgICAgIG1hZ2ljID0gc2VsZi5oYW5kbGUucmVhZGxpbmUoKS5kZWNvZGUoJ3V0Zi04JykKCiAgICAgICAgaWYgbWFnaWMuc3RhcnRzd2l0aChzZWxmLlJQQTNfTUFHSUMpOgogICAgICAgICAgICByZXR1cm4gMwogICAgICAgIGVsaWYgbWFnaWMuc3RhcnRzd2l0aChzZWxmLlJQQTJfTUFHSUMpOgogICAgICAgICAgICByZXR1cm4gMgogICAgICAgIGVsaWYgc2VsZi5maWxlLmVuZHN3aXRoKCcucnBpJyk6CiAgICAgICAgICAgIHJldHVybiAxCgogICAgICAgIHJhaXNlIFZhbHVlRXJyb3IoJ3RoZSBnaXZlbiBmaWxlIGlzIG5vdCBhIHZhbGlkIFJlblwnUHkgYXJjaGl2ZSwgb3IgYW4gdW5zdXBwb3J0ZWQgdmVyc2lvbicpCgogICAgIyBFeHRyYWN0IGZpbGUgaW5kZXhlcyBmcm9tIG9wZW5lZCBhcmNoaXZlLgogICAgZGVmIGV4dHJhY3RfaW5kZXhlcyhzZWxmKToKICAgICAgICBzZWxmLmhhbmRsZS5zZWVrKDApCiAgICAgICAgaW5kZXhlcyA9IE5vbmUKCiAgICAgICAgaWYgc2VsZi52ZXJzaW9uID09IDIgb3Igc2VsZi52ZXJzaW9uID09IDM6CiAgICAgICAgICAgICMgRmV0Y2ggbWV0YWRhdGEuCiAgICAgICAgICAgIG1ldGFkYXRhID0gc2VsZi5oYW5kbGUucmVhZGxpbmUoKQogICAgICAgICAgICB2YWxzID0gbWV0YWRhdGEuc3BsaXQoKQogICAgICAgICAgICBvZmZzZXQgPSBpbnQodmFsc1sxXSwgMTYpCiAgICAgICAgICAgIGlmIHNlbGYudmVyc2lvbiA9PSAzOgogICAgICAgICAgICAgICAgc2VsZi5rZXkgPSAwCiAgICAgICAgICAgICAgICBmb3Igc3Via2V5IGluIHZhbHNbMjpdOgogICAgICAgICAgICAgICAgICAgIHNlbGYua2V5IF49IGludChzdWJrZXksIDE2KQoKICAgICAgICAgICAgIyBMb2FkIGluIGluZGV4ZXMuCiAgICAgICAgICAgIHNlbGYuaGFuZGxlLnNlZWsob2Zmc2V0KQogICAgICAgICAgICBjb250ZW50cyA9IGNvZGVjcy5kZWNvZGUoc2VsZi5oYW5kbGUucmVhZCgpLCAnemxpYicpCiAgICAgICAgICAgIGluZGV4ZXMgPSBfdW5waWNrbGUoY29udGVudHMpCgogICAgICAgICAgICAjIERlb2JmdXNjYXRlIGluZGV4ZXMuCiAgICAgICAgICAgIGlmIHNlbGYudmVyc2lvbiA9PSAzOgogICAgICAgICAgICAgICAgb2JmdXNjYXRlZF9pbmRleGVzID0gaW5kZXhlcwogICAgICAgICAgICAgICAgaW5kZXhlcyA9IHt9CiAgICAgICAgICAgICAgICBmb3IgaSBpbiBvYmZ1c2NhdGVkX2luZGV4ZXMua2V5cygpOgogICAgICAgICAgICAgICAgICAgIGlmIGxlbihvYmZ1c2NhdGVkX2luZGV4ZXNbaV1bMF0pID09IDI6CiAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4ZXNbaV0gPSBbIChvZmZzZXQgXiBzZWxmLmtleSwgbGVuZ3RoIF4gc2VsZi5rZXkpIGZvciBvZmZzZXQsIGxlbmd0aCBpbiBvYmZ1c2NhdGVkX2luZGV4ZXNbaV0gXQogICAgICAgICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4ZXNbaV0gPSBbIChvZmZzZXQgXiBzZWxmLmtleSwgbGVuZ3RoIF4gc2VsZi5rZXksIHByZWZpeCkgZm9yIG9mZnNldCwgbGVuZ3RoLCBwcmVmaXggaW4gb2JmdXNjYXRlZF9pbmRleGVzW2ldIF0KICAgICAgICBlbHNlOgogICAgICAgICAgICBpbmRleGVzID0gcGlja2xlLmxvYWRzKGNvZGVjcy5kZWNvZGUoc2VsZi5oYW5kbGUucmVhZCgpLCAnemxpYicpKQoKICAgICAgICByZXR1cm4gaW5kZXhlcwoKICAgICMgR2VuZXJhdGUgcHNldWRvcmFuZG9tIHBhZGRpbmcgKGZvciB3aGF0ZXZlciByZWFzb24pLgogICAgZGVmIGdlbmVyYXRlX3BhZGRpbmcoc2VsZik6CiAgICAgICAgbGVuZ3RoID0gcmFuZG9tLnJhbmRpbnQoMSwgc2VsZi5wYWRsZW5ndGgpCgogICAgICAgIHBhZGRpbmcgPSAnJwogICAgICAgIHdoaWxlIGxlbmd0aCA+IDA6CiAgICAgICAgICAgIHBhZGRpbmcgKz0gY2hyKHJhbmRvbS5yYW5kaW50KDEsIDI1NSkpCiAgICAgICAgICAgIGxlbmd0aCAtPSAxCgogICAgICAgIHJldHVybiBwYWRkaW5nCgogICAgIyBDb252ZXJ0cyBhIGZpbGVuYW1lIHRvIGFyY2hpdmUgZm9ybWF0LgogI
set rpatool2=CAgZGVmIGNvbnZlcnRfZmlsZW5hbWUoc2VsZiwgZmlsZW5hbWUpOgogICAgICAgIChkcml2ZSwgZmlsZW5hbWUpID0gb3MucGF0aC5zcGxpdGRyaXZlKG9zLnBhdGgubm9ybXBhdGgoZmlsZW5hbWUpLnJlcGxhY2Uob3Muc2VwLCAnLycpKQogICAgICAgIHJldHVybiBmaWxlbmFtZQoKICAgICMgRGVidWcgKHZlcmJvc2UpIG1lc3NhZ2VzLgogICAgZGVmIHZlcmJvc2VfcHJpbnQoc2VsZiwgbWVzc2FnZSk6CiAgICAgICAgaWYgc2VsZi52ZXJib3NlOgogICAgICAgICAgICBwcmludChtZXNzYWdlKQoKCiAgICAjIExpc3QgZmlsZXMgaW4gYXJjaGl2ZSBhbmQgY3VycmVudCBpbnRlcm5hbCBzdG9yYWdlLgogICAgZGVmIGxpc3Qoc2VsZik6CiAgICAgICAgcmV0dXJuIGxpc3Qoc2VsZi5pbmRleGVzLmtleXMoKSkgKyBsaXN0KHNlbGYuZmlsZXMua2V5cygpKQoKICAgICMgQ2hlY2sgaWYgYSBmaWxlIGV4aXN0cyBpbiB0aGUgYXJjaGl2ZS4KICAgIGRlZiBoYXNfZmlsZShzZWxmLCBmaWxlbmFtZSk6CiAgICAgICAgZmlsZW5hbWUgPSBfdW5pY29kZShmaWxlbmFtZSkKICAgICAgICByZXR1cm4gZmlsZW5hbWUgaW4gc2VsZi5pbmRleGVzLmtleXMoKSBvciBmaWxlbmFtZSBpbiBzZWxmLmZpbGVzLmtleXMoKQoKICAgICMgUmVhZCBmaWxlIGZyb20gYXJjaGl2ZSBvciBpbnRlcm5hbCBzdG9yYWdlLgogICAgZGVmIHJlYWQoc2VsZiwgZmlsZW5hbWUpOgogICAgICAgIGZpbGVuYW1lID0gc2VsZi5jb252ZXJ0X2ZpbGVuYW1lKF91bmljb2RlKGZpbGVuYW1lKSkKCiAgICAgICAgIyBDaGVjayBpZiB0aGUgZmlsZSBleGlzdHMgaW4gb3VyIGluZGV4ZXMuCiAgICAgICAgIyBpZiBmaWxlbmFtZSBub3QgaW4gc2VsZi5maWxlcyBhbmQgZmlsZW5hbWUgbm90IGluIHNlbGYuaW5kZXhlczoKICAgICAgICAjICAgICByYWlzZSBJT0Vycm9yKGVycm5vLkVOT0VOVCwgJ3RoZSByZXF1ZXN0ZWQgZmlsZSB7MH0gZG9lcyBub3QgZXhpc3QgaW4gdGhlIGdpdmVuIFJlblwnUHkgYXJjaGl2ZScuZm9ybWF0KAogICAgICAgICMgICAgICAgICBfcHJpbnRhYmxlKGZpbGVuYW1lKSkpCgogICAgICAgICMgSWYgaXQncyBpbiBvdXIgb3BlbmVkIGFyY2hpdmUgaW5kZXgsIGFuZCBvdXIgYXJjaGl2ZSBoYW5kbGUgaXNuJ3QgdmFsaWQsIHNvbWV0aGluZyBpcyBvYnZpb3VzbHkgd3JvbmcuCiAgICAgICAgaWYgZmlsZW5hbWUgbm90IGluIHNlbGYuZmlsZXMgYW5kIGZpbGVuYW1lIGluIHNlbGYuaW5kZXhlcyBhbmQgc2VsZi5oYW5kbGUgaXMgTm9uZToKICAgICAgICAgICAgcmFpc2UgSU9FcnJvcihlcnJuby5FTk9FTlQsICd0aGUgcmVxdWVzdGVkIGZpbGUgezB9IGRvZXMgbm90IGV4aXN0IGluIHRoZSBnaXZlbiBSZW5cJ1B5IGFyY2hpdmUnLmZvcm1hdCgKICAgICAgICAgICAgICAgIF9wcmludGFibGUoZmlsZW5hbWUpKSkKCiAgICAgICAgIyBDaGVjayBvdXIgc2ltcGxpZmllZCBpbnRlcm5hbCBpbmRleGVzIGZpcnN0LCBpbiBjYXNlIHNvbWVvbmUgd2FudHMgdG8gcmVhZCBhIGZpbGUgdGhleSBhZGRlZCBiZWZvcmUgd2l0aG91dCBzYXZpbmcsIGZvciBzb21lIHVuaG9seSByZWFzb24uCiAgICAgICAgaWYgZmlsZW5hbWUgaW4gc2VsZi5maWxlczoKICAgICAgICAgICAgc2VsZi52ZXJib3NlX3ByaW50KCdSZWFkaW5nIGZpbGUgezB9IGZyb20gaW50ZXJuYWwgc3RvcmFnZS4uLicuZm9ybWF0KF9wcmludGFibGUoZmlsZW5hbWUpKSkKICAgICAgICAgICAgcmV0dXJuIHNlbGYuZmlsZXNbZmlsZW5hbWVdCiAgICAgICAgIyBXZSBuZWVkIHRvIHJlYWQgdGhlIGZpbGUgZnJvbSBvdXIgb3BlbiBhcmNoaXZlLgogICAgICAgIGVsc2U6CiAgICAgICAgICAgICMgUmVhZCBvZmZzZXQgYW5kIGxlbmd0aCwgc2VlayB0byB0aGUgb2Zmc2V0IGFuZCByZWFkIHRoZSBmaWxlIGNvbnRlbnRzLgogICAgICAgICAgICBpZiBsZW4oc2VsZi5pbmRleGVzW2ZpbGVuYW1lXVswXSkgPT0gMzoKICAgICAgICAgICAgICAgIChvZmZzZXQsIGxlbmd0aCwgcHJlZml4KSA9IHNlbGYuaW5kZXhlc1tmaWxlbmFtZV1bMF0KICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAgIChvZmZzZXQsIGxlbmd0aCkgPSBzZWxmLmluZGV4ZXNbZmlsZW5hbWVdWzBdCiAgICAgICAgICAgICAgICBwcmVmaXggPSAnJwoKICAgICAgICAgICAgc2VsZi52ZXJib3NlX3ByaW50KCdSZWFkaW5nIGZpbGUgezB9IGZyb20gZGF0YSBmaWxlIHsxfS4uLiAob2Zmc2V0ID0gezJ9LCBsZW5ndGggPSB7M30gYnl0ZXMpJy5mb3JtYXQoCiAgICAgICAgICAgICAgICBfcHJpbnRhYmxlKGZpbGVuYW1lKSwgc2VsZi5maWxlLCBvZmZzZXQsIGxlbmd0aCkpCiAgICAgICAgICAgIHNlbGYuaGFuZGxlLnNlZWsob2Zmc2V0KQogICAgICAgICAgICByZXR1cm4gX3VubWFuZ2xlKHByZWZpeCkgKyBzZWxmLmhhbmRsZS5yZWFkKGxlbmd0aCAtIGxlbihwcmVmaXgpKQoKICAgICMgTW9kaWZ5IGEgZmlsZSBpbiBhcmNoaXZlIG9yIGludGVybmFsIHN0b3JhZ2UuCiAgICBkZWYgY2hhbmdlKHNlbGYsIGZpbGVuYW1lLCBjb250ZW50cyk6CiAgICAgICAgZmlsZW5hbWUgPSBfdW5pY29kZShmaWxlbmFtZSkKCiAgICAgICAgIyBPdXIgJ2NoYW5nZScgaXMgYmFzaWNhbGx5IHJlbW92aW5nIHRoZSBmaWxlIGZyb20gb3VyIGluZGV4ZXMgZmlyc3QsIGFuZCB0aGVuIHJlLWFkZGluZyBpdC4KICAgICAgICBzZWxmLnJlbW92ZShmaWxlbmFtZSkKICAgICAgICBzZWxmLmFkZChmaWxlbmFtZSwgY29udGVudHMpCgogICAgIyBBZGQgYSBmaWxlIHRvIHRoZSBpbnRlcm5hbCBzdG9yYWdlLgogICAgZGVmIGFkZChzZWxmLCBmaWxlbmFtZSwgY29udGVudHMpOgogICAgICAgIGZpbGVuYW1lID0gc2VsZi5jb252ZXJ0X2ZpbGVuYW1lKF91bmljb2RlKGZpbGVuYW1lKSkKICAgICAgICBpZiBmaWxlbmFtZSBpbiBzZWxmLmZpbGVzIG9yIGZpbGVuYW1lIGluIHNlbGYuaW5kZXhlczoKICAgICAgICAgICAgcmFpc2UgVmFsdWVFcnJvcignZmlsZSB7MH0gYWxyZWFkeSBleGlzdHMgaW4gYXJjaGl2ZScuZm9ybWF0KF9wcmludGFibGUoZmlsZW5hbWUpKSkKCiAgICAgICAgc2VsZi52ZXJib3NlX3ByaW50KCdBZGRpbmcgZmlsZSB7MH0gdG8gYXJjaGl2ZS4uLiAobGVuZ3RoID0gezF9IGJ5dGVzKScuZm9ybWF0KAogICAgICAgICAgICBfcHJpbnRhYmxlKGZpbGVuYW1lKSwgbGVuKGNvbnRlbnRzKSkpCiAgICAgICAgc2VsZi5maWxlc1tmaWxlbmFtZV0gPSBjb250ZW50cwoKICAgICMgUmVtb3ZlIGEgZmlsZSBmcm9tIGFyY2hpdmUgb3IgaW50ZXJuYWwgc3RvcmFnZS4KICAgIGRlZiByZW1vdmUoc2VsZiwgZmlsZW5hbWUpOgogICAgICAgIGZpbGVuYW1lID0gX3VuaWNvZGUoZmlsZW5hbWUpCiAgICAgICAgaWYgZmlsZW5hbWUgaW4gc2VsZi5maWxlczoKICAgICAgICAgICAgc2VsZi52ZXJib3NlX3ByaW50KCdSZW1vdmluZyBmaWxlIHswfSBmcm9tIGludGVybmFsIHN0b3JhZ2UuLi4nLmZvcm1hdChfcHJpbnRhYmxlKGZpbGVuYW1lKSkpCiAgICAgICAgICAgIGRlbCBzZWxmLmZpbGVzW2ZpbGVuYW1lXQogICAgICAgIGVsaWYgZmlsZW5hbWUgaW4gc2VsZi5pbmRleGVzOgogICAgICAgICAgICBzZWxmLnZlcmJvc2VfcHJpbnQoJ1JlbW92aW5nIGZpbGUgezB9IGZyb20gYXJjaGl2ZSBpbmRleGVzLi4uJy5mb3JtYXQoX3ByaW50YWJsZS
set rpatool3=hmaWxlbmFtZSkpKQogICAgICAgICAgICBkZWwgc2VsZi5pbmRleGVzW2ZpbGVuYW1lXQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIHJhaXNlIElPRXJyb3IoZXJybm8uRU5PRU5ULCAndGhlIHJlcXVlc3RlZCBmaWxlIHswfSBkb2VzIG5vdCBleGlzdCBpbiB0aGlzIGFyY2hpdmUnLmZvcm1hdChfcHJpbnRhYmxlKGZpbGVuYW1lKSkpCgogICAgIyBMb2FkIGFyY2hpdmUuCiAgICBkZWYgbG9hZChzZWxmLCBmaWxlbmFtZSk6CiAgICAgICAgZmlsZW5hbWUgPSBfdW5pY29kZShmaWxlbmFtZSkKCiAgICAgICAgaWYgc2VsZi5oYW5kbGUgaXMgbm90IE5vbmU6CiAgICAgICAgICAgIHNlbGYuaGFuZGxlLmNsb3NlKCkKICAgICAgICBzZWxmLmZpbGUgPSBmaWxlbmFtZQogICAgICAgIHNlbGYuZmlsZXMgPSB7fQogICAgICAgIHNlbGYuaGFuZGxlID0gb3BlbihzZWxmLmZpbGUsICdyYicpCiAgICAgICAgc2VsZi52ZXJzaW9uID0gc2VsZi5nZXRfdmVyc2lvbigpCiAgICAgICAgc2VsZi5pbmRleGVzID0gc2VsZi5leHRyYWN0X2luZGV4ZXMoKQoKICAgICMgU2F2ZSBjdXJyZW50IHN0YXRlIGludG8gYSBuZXcgZmlsZSwgbWVyZ2luZyBhcmNoaXZlIGFuZCBpbnRlcm5hbCBzdG9yYWdlLCByZWJ1aWxkaW5nIGluZGV4ZXMsIGFuZCBvcHRpb25hbGx5IHNhdmluZyBpbiBhbm90aGVyIGZvcm1hdCB2ZXJzaW9uLgogICAgZGVmIHNhdmUoc2VsZiwgZmlsZW5hbWUgPSBOb25lKToKICAgICAgICBmaWxlbmFtZSA9IF91bmljb2RlKGZpbGVuYW1lKQoKICAgICAgICBpZiBmaWxlbmFtZSBpcyBOb25lOgogICAgICAgICAgICBmaWxlbmFtZSA9IHNlbGYuZmlsZQogICAgICAgIGlmIGZpbGVuYW1lIGlzIE5vbmU6CiAgICAgICAgICAgIHJhaXNlIFZhbHVlRXJyb3IoJ25vIHRhcmdldCBmaWxlIGZvdW5kIGZvciBzYXZpbmcgYXJjaGl2ZScpCiAgICAgICAgaWYgc2VsZi52ZXJzaW9uICE9IDIgYW5kIHNlbGYudmVyc2lvbiAhPSAzOgogICAgICAgICAgICByYWlzZSBWYWx1ZUVycm9yKCdzYXZpbmcgaXMgb25seSBzdXBwb3J0ZWQgZm9yIHZlcnNpb24gMiBhbmQgMyBhcmNoaXZlcycpCgogICAgICAgIHNlbGYudmVyYm9zZV9wcmludCgnUmVidWlsZGluZyBhcmNoaXZlIGluZGV4Li4uJykKICAgICAgICAjIEZpbGwgb3VyIG93biBmaWxlcyBzdHJ1Y3R1cmUgd2l0aCB0aGUgZmlsZXMgYWRkZWQgb3IgY2hhbmdlZCBpbiB0aGlzIHNlc3Npb24uCiAgICAgICAgZmlsZXMgPSBzZWxmLmZpbGVzCiAgICAgICAgIyBGaXJzdCwgcmVhZCBmaWxlcyBmcm9tIHRoZSBjdXJyZW50IGFyY2hpdmUgaW50byBvdXIgZmlsZXMgc3RydWN0dXJlLgogICAgICAgIGZvciBmaWxlIGluIGxpc3Qoc2VsZi5pbmRleGVzLmtleXMoKSk6CiAgICAgICAgICAgIGNvbnRlbnQgPSBzZWxmLnJlYWQoZmlsZSkKICAgICAgICAgICAgIyBSZW1vdmUgZnJvbSBpbmRleGVzIGFycmF5IG9uY2UgcmVhZCwgYWRkIHRvIG91ciBvd24gYXJyYXkuCiAgICAgICAgICAgIGRlbCBzZWxmLmluZGV4ZXNbZmlsZV0KICAgICAgICAgICAgZmlsZXNbZmlsZV0gPSBjb250ZW50CgogICAgICAgICMgUHJlZGljdCBoZWFkZXIgbGVuZ3RoLCB3ZSdsbCB3cml0ZSB0aGF0IG9uZSBsYXN0LgogICAgICAgIG9mZnNldCA9IDAKICAgICAgICBpZiBzZWxmLnZlcnNpb24gPT0gMzoKICAgICAgICAgICAgb2Zmc2V0ID0gMzQKICAgICAgICBlbGlmIHNlbGYudmVyc2lvbiA9PSAyOgogICAgICAgICAgICBvZmZzZXQgPSAyNQogICAgICAgIGFyY2hpdmUgPSBvcGVuKGZpbGVuYW1lLCAnd2InKQogICAgICAgIGFyY2hpdmUuc2VlayhvZmZzZXQpCgogICAgICAgICMgQnVpbGQgb3VyIG93biBpbmRleGVzIHdoaWxlIHdyaXRpbmcgZmlsZXMgdG8gdGhlIGFyY2hpdmUuCiAgICAgICAgaW5kZXhlcyA9IHt9CiAgICAgICAgc2VsZi52ZXJib3NlX3ByaW50KCdXcml0aW5nIGZpbGVzIHRvIGFyY2hpdmUgZmlsZS4uLicpCiAgICAgICAgZm9yIGZpbGUsIGNvbnRlbnQgaW4gZmlsZXMuaXRlbXMoKToKICAgICAgICAgICAgIyBHZW5lcmF0ZSByYW5kb20gcGFkZGluZywgZm9yIHdoYXRldmVyIHJlYXNvbi4KICAgICAgICAgICAgaWYgc2VsZi5wYWRsZW5ndGggPiAwOgogICAgICAgICAgICAgICAgcGFkZGluZyA9IHNlbGYuZ2VuZXJhdGVfcGFkZGluZygpCiAgICAgICAgICAgICAgICBhcmNoaXZlLndyaXRlKHBhZGRpbmcpCiAgICAgICAgICAgICAgICBvZmZzZXQgKz0gbGVuKHBhZGRpbmcpCgogICAgICAgICAgICBhcmNoaXZlLndyaXRlKGNvbnRlbnQpCiAgICAgICAgICAgICMgVXBkYXRlIGluZGV4LgogICAgICAgICAgICBpZiBzZWxmLnZlcnNpb24gPT0gMzoKICAgICAgICAgICAgICAgIGluZGV4ZXNbZmlsZV0gPSBbIChvZmZzZXQgXiBzZWxmLmtleSwgbGVuKGNvbnRlbnQpIF4gc2VsZi5rZXkpIF0KICAgICAgICAgICAgZWxpZiBzZWxmLnZlcnNpb24gPT0gMjoKICAgICAgICAgICAgICAgIGluZGV4ZXNbZmlsZV0gPSBbIChvZmZzZXQsIGxlbihjb250ZW50KSkgXQogICAgICAgICAgICBvZmZzZXQgKz0gbGVuKGNvbnRlbnQpCgogICAgICAgICMgV3JpdGUgdGhlIGluZGV4ZXMuCiAgICAgICAgc2VsZi52ZXJib3NlX3ByaW50KCdXcml0aW5nIGFyY2hpdmUgaW5kZXggdG8gYXJjaGl2ZSBmaWxlLi4uJykKICAgICAgICBhcmNoaXZlLndyaXRlKGNvZGVjcy5lbmNvZGUocGlja2xlLmR1bXBzKGluZGV4ZXMsIHNlbGYuUElDS0xFX1BST1RPQ09MKSwgJ3psaWInKSkKICAgICAgICAjIE5vdyB3cml0ZSB0aGUgaGVhZGVyLgogICAgICAgIHNlbGYudmVyYm9zZV9wcmludCgnV3JpdGluZyBoZWFkZXIgdG8gYXJjaGl2ZSBmaWxlLi4uICh2ZXJzaW9uID0gUlBBdnswfSknLmZvcm1hdChzZWxmLnZlcnNpb24pKQogICAgICAgIGFyY2hpdmUuc2VlaygwKQogICAgICAgIGlmIHNlbGYudmVyc2lvbiA9PSAzOgogICAgICAgICAgICBhcmNoaXZlLndyaXRlKGNvZGVjcy5lbmNvZGUoJ3t9ezowMTZ4fSB7OjA4eH1cbicuZm9ybWF0KHNlbGYuUlBBM19NQUdJQywgb2Zmc2V0LCBzZWxmLmtleSkpKQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIGFyY2hpdmUud3JpdGUoY29kZWNzLmVuY29kZSgne317OjAxNnh9XG4nLmZvcm1hdChzZWxmLlJQQTJfTUFHSUMsIG9mZnNldCkpKQogICAgICAgICMgV2UncmUgZG9uZSwgY2xvc2UgaXQuCiAgICAgICAgYXJjaGl2ZS5jbG9zZSgpCgogICAgICAgICMgUmVsb2FkIHRoZSBmaWxlIGluIG91ciBpbm5lciBkYXRhYmFzZS4KICAgICAgICBzZWxmLmxvYWQoZmlsZW5hbWUpCgppZiBfX25hbWVfXyA9PSAiX19tYWluX18iOgogICAgaW1wb3J0IGFyZ3BhcnNlCgogICAgcGFyc2VyID0gYXJncGFyc2UuQXJndW1lbnRQYXJzZXIoCiAgICAgICAgZGVzY3JpcHRpb249J0EgdG9vbCBmb3Igd29ya2luZyB3aXRoIFJlblwnUHkgYXJjaGl2ZSBmaWxlcy4nLAogICAgICAgIGVwaWxvZz0nVGhlIEZJTEUgYXJndW1lbnQgY2FuIG9wdGlvbmFsbHkgYmUgaW4gQVJDSElWRT1SRUFMIGZvcm1hdCwgbWFwcGluZyBhIGZpbGUgaW4gdGhlIGFyY2hpdmUgZmlsZSBzeXN0ZW0gdG8gYSBmaWxlIG9uIHlvdXIgcmVhbCBmaWxlIHN5c3RlbS4gQW4gZXhhbXBsZSBvZiB0aGlzOiBycGF0b29sIC14IHRlc3QucnBhIHNjcmlwdC5ycHljPS9ob21lL2Zvby90ZXN0LnJweWMnLAogICAgICAgIGFkZF9
set rpatool4=oZWxwPUZhbHNlKQoKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJ2FyY2hpdmUnLCBtZXRhdmFyPSdBUkNISVZFJywgaGVscD0nVGhlIFJlblwncHkgYXJjaGl2ZSBmaWxlIHRvIG9wZXJhdGUgb24uJykKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJ2ZpbGVzJywgbWV0YXZhcj0nRklMRScsIG5hcmdzPScqJywgYWN0aW9uPSdhcHBlbmQnLCBoZWxwPSdaZXJvIG9yIG1vcmUgZmlsZXMgdG8gb3BlcmF0ZSBvbi4nKQoKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJy1sJywgJy0tbGlzdCcsIGFjdGlvbj0nc3RvcmVfdHJ1ZScsIGhlbHA9J0xpc3QgZmlsZXMgaW4gYXJjaGl2ZSBBUkNISVZFLicpCiAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCcteCcsICctLWV4dHJhY3QnLCBhY3Rpb249J3N0b3JlX3RydWUnLCBoZWxwPSdFeHRyYWN0IEZJTEVzIGZyb20gQVJDSElWRS4nKQogICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLWMnLCAnLS1jcmVhdGUnLCBhY3Rpb249J3N0b3JlX3RydWUnLCBoZWxwPSdDcmVhdGl2ZSBBUkNISVZFIGZyb20gRklMRXMuJykKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJy1kJywgJy0tZGVsZXRlJywgYWN0aW9uPSdzdG9yZV90cnVlJywgaGVscD0nRGVsZXRlIEZJTEVzIGZyb20gQVJDSElWRS4nKQogICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLWEnLCAnLS1hcHBlbmQnLCBhY3Rpb249J3N0b3JlX3RydWUnLCBoZWxwPSdBcHBlbmQgRklMRXMgdG8gQVJDSElWRS4nKQoKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJy0yJywgJy0tdHdvJywgYWN0aW9uPSdzdG9yZV90cnVlJywgaGVscD0nVXNlIHRoZSBSUEF2MiBmb3JtYXQgZm9yIGNyZWF0aW5nL2FwcGVuZGluZyB0byBhcmNoaXZlcy4nKQogICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLTMnLCAnLS10aHJlZScsIGFjdGlvbj0nc3RvcmVfdHJ1ZScsIGhlbHA9J1VzZSB0aGUgUlBBdjMgZm9ybWF0IGZvciBjcmVhdGluZy9hcHBlbmRpbmcgdG8gYXJjaGl2ZXMgKGRlZmF1bHQpLicpCgogICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLWsnLCAnLS1rZXknLCBtZXRhdmFyPSdLRVknLCBoZWxwPSdUaGUgb2JmdXNjYXRpb24ga2V5IHVzZWQgZm9yIGNyZWF0aW5nIFJQQXYzIGFyY2hpdmVzLCBpbiBoZXhhZGVjaW1hbCAoZGVmYXVsdDogMHhERUFEQkVFRikuJykKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJy1wJywgJy0tcGFkZGluZycsIG1ldGF2YXI9J0NPVU5UJywgaGVscD0nVGhlIG1heGltdW0gbnVtYmVyIG9mIGJ5dGVzIG9mIHBhZGRpbmcgdG8gYWRkIGJldHdlZW4gZmlsZXMgKGRlZmF1bHQ6IDApLicpCiAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctbycsICctLW91dGZpbGUnLCBoZWxwPSdBbiBhbHRlcm5hdGl2ZSBvdXRwdXQgYXJjaGl2ZSBmaWxlIHdoZW4gYXBwZW5kaW5nIHRvIG9yIGRlbGV0aW5nIGZyb20gYXJjaGl2ZXMsIG9yIG91dHB1dCBkaXJlY3Rvcnkgd2hlbiBleHRyYWN0aW5nLicpCgogICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLWgnLCAnLS1oZWxwJywgYWN0aW9uPSdoZWxwJywgaGVscD0nUHJpbnQgdGhpcyBoZWxwIGFuZCBleGl0LicpCiAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctdicsICctLXZlcmJvc2UnLCBhY3Rpb249J3N0b3JlX3RydWUnLCBoZWxwPSdCZSBhIGJpdCBtb3JlIHZlcmJvc2Ugd2hpbGUgcGVyZm9ybWluZyBvcGVyYXRpb25zLicpCiAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctVicsICctLXZlcnNpb24nLCBhY3Rpb249J3ZlcnNpb24nLCB2ZXJzaW9uPSdycGF0b29sIHYwLjgnLCBoZWxwPSdTaG93IHZlcnNpb24gaW5mb3JtYXRpb24uJykKICAgIGFyZ3VtZW50cyA9IHBhcnNlci5wYXJzZV9hcmdzKCkKCiAgICAjIERldGVybWluZSBSUEEgdmVyc2lvbi4KICAgIGlmIGFyZ3VtZW50cy50d286CiAgICAgICAgdmVyc2lvbiA9IDIKICAgIGVsc2U6CiAgICAgICAgdmVyc2lvbiA9IDMKCiAgICAjIERldGVybWluZSBSUEF2MyBrZXkuCiAgICBpZiAna2V5JyBpbiBhcmd1bWVudHMgYW5kIGFyZ3VtZW50cy5rZXkgaXMgbm90IE5vbmU6CiAgICAgICAga2V5ID0gaW50KGFyZ3VtZW50cy5rZXksIDE2KQogICAgZWxzZToKICAgICAgICBrZXkgPSAweERFQURCRUVGCgogICAgIyBEZXRlcm1pbmUgcGFkZGluZyBieXRlcy4KICAgIGlmICdwYWRkaW5nJyBpbiBhcmd1bWVudHMgYW5kIGFyZ3VtZW50cy5wYWRkaW5nIGlzIG5vdCBOb25lOgogICAgICAgIHBhZGRpbmcgPSBpbnQoYXJndW1lbnRzLnBhZGRpbmcpCiAgICBlbHNlOgogICAgICAgIHBhZGRpbmcgPSAwCgogICAgIyBEZXRlcm1pbmUgb3V0cHV0IGZpbGUvZGlyZWN0b3J5IGFuZCBpbnB1dCBhcmNoaXZlCiAgICBpZiBhcmd1bWVudHMuY3JlYXRlOgogICAgICAgIGFyY2hpdmUgPSBOb25lCiAgICAgICAgb3V0cHV0ID0gX3VuaWNvZGUoYXJndW1lbnRzLmFyY2hpdmUpCiAgICBlbHNlOgogICAgICAgIGFyY2hpdmUgPSBfdW5pY29kZShhcmd1bWVudHMuYXJjaGl2ZSkKICAgICAgICBpZiAnb3V0ZmlsZScgaW4gYXJndW1lbnRzIGFuZCBhcmd1bWVudHMub3V0ZmlsZSBpcyBub3QgTm9uZToKICAgICAgICAgICAgb3V0cHV0ID0gX3VuaWNvZGUoYXJndW1lbnRzLm91dGZpbGUpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgIyBEZWZhdWx0IG91dHB1dCBkaXJlY3RvcnkgZm9yIGV4dHJhY3Rpb24gaXMgdGhlIGN1cnJlbnQgZGlyZWN0b3J5LgogICAgICAgICAgICBpZiBhcmd1bWVudHMuZXh0cmFjdDoKICAgICAgICAgICAgICAgIG91dHB1dCA9ICcuJwogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgb3V0cHV0ID0gX3VuaWNvZGUoYXJndW1lbnRzLmFyY2hpdmUpCgogICAgIyBOb3JtYWxpemUgZmlsZXMuCiAgICBpZiBsZW4oYXJndW1lbnRzLmZpbGVzKSA+IDAgYW5kIGlzaW5zdGFuY2UoYXJndW1lbnRzLmZpbGVzWzBdLCBsaXN0KToKICAgICAgICBhcmd1bWVudHMuZmlsZXMgPSBhcmd1bWVudHMuZmlsZXNbMF0KCiAgICB0cnk6CiAgICAgICAgYXJjaGl2ZSA9IFJlblB5QXJjaGl2ZShhcmNoaXZlLCBwYWRsZW5ndGg9cGFkZGluZywga2V5PWtleSwgdmVyc2lvbj12ZXJzaW9uLCB2ZXJib3NlPWFyZ3VtZW50cy52ZXJib3NlKQogICAgZXhjZXB0IElPRXJyb3IgYXMgZToKICAgICAgICBwcmludCgnQ291bGQgbm90IG9wZW4gYXJjaGl2ZSBmaWxlIHswfSBmb3IgcmVhZGluZzogezF9Jy5mb3JtYXQoYXJjaGl2ZSwgZSksIGZpbGU9c3lzLnN0ZGVycikKICAgICAgICBzeXMuZXhpdCgxKQoKICAgIGlmIGFyZ3VtZW50cy5jcmVhdGUgb3IgYXJndW1lbnRzLmFwcGVuZDoKICAgICAgICAjIFdlIG5lZWQgdGhpcyBzZXBlcmF0ZSBmdW5jdGlvbiB0byByZWN1cnNpdmVseSBwcm9jZXNzIGRpcmVjdG9yaWVzLgogICAgICAgIGRlZiBhZGRfZmlsZShmaWxlbmFtZSk6CiAgICAgICAgICAgICMgSWYgdGhlIGFyY2hpdmUgcGF0aCBkaWZmZXJzIGZyb20gdGhlIGFjdHVhbCBmaWxlIHBhdGgsIGFzIGdpdmVuIGluIHRoZSBhcmd1bWVudCwKICAgICAgICAgICAgIyBleHRyYWN0IHRoZSBhcmNoaXZlIHBhdGggYW5kIGFjdHVhbCBmaWxlIHBhdGguCiAgICAgICAgICAgIGlmIGZpbGVuYW1lLmZpbmQoJz0nKSAhPSAtMToKICAgICAgICAgICAgICAgIChvdXRmaWxlLCBmaWxlbmFtZSkgPSBmaWxlbmFtZS5zcGxpdCgnPScsIDIpCiAgICAgICAgICAgIGVsc2U6CiAg
set rpatool5=ICAgICAgICAgICAgICBvdXRmaWxlID0gZmlsZW5hbWUKCiAgICAgICAgICAgIGlmIG9zLnBhdGguaXNkaXIoZmlsZW5hbWUpOgogICAgICAgICAgICAgICAgZm9yIGZpbGUgaW4gb3MubGlzdGRpcihmaWxlbmFtZSk6CiAgICAgICAgICAgICAgICAgICAgIyBXZSBuZWVkIHRvIGRvIHRoaXMgaW4gb3JkZXIgdG8gbWFpbnRhaW4gYSBwb3NzaWJsZSBBUkNISVZFPVJFQUwgbWFwcGluZyBiZXR3ZWVuIGRpcmVjdG9yaWVzLgogICAgICAgICAgICAgICAgICAgIGFkZF9maWxlKG91dGZpbGUgKyBvcy5zZXAgKyBmaWxlICsgJz0nICsgZmlsZW5hbWUgKyBvcy5zZXAgKyBmaWxlKQogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgICAgIHdpdGggb3BlbihmaWxlbmFtZSwgJ3JiJykgYXMgZmlsZToKICAgICAgICAgICAgICAgICAgICAgICAgYXJjaGl2ZS5hZGQob3V0ZmlsZSwgZmlsZS5yZWFkKCkpCiAgICAgICAgICAgICAgICBleGNlcHQgRXhjZXB0aW9uIGFzIGU6CiAgICAgICAgICAgICAgICAgICAgcHJpbnQoJ0NvdWxkIG5vdCBhZGQgZmlsZSB7MH0gdG8gYXJjaGl2ZTogezF9Jy5mb3JtYXQoZmlsZW5hbWUsIGUpLCBmaWxlPXN5cy5zdGRlcnIpCgogICAgICAgICMgSXRlcmF0ZSBvdmVyIHRoZSBnaXZlbiBmaWxlcyB0byBhZGQgdG8gYXJjaGl2ZS4KICAgICAgICBmb3IgZmlsZW5hbWUgaW4gYXJndW1lbnRzLmZpbGVzOgogICAgICAgICAgICBhZGRfZmlsZShfdW5pY29kZShmaWxlbmFtZSkpCgogICAgICAgICMgU2V0IHZlcnNpb24gZm9yIHNhdmluZywgYW5kIHNhdmUuCiAgICAgICAgYXJjaGl2ZS52ZXJzaW9uID0gdmVyc2lvbgogICAgICAgIHRyeToKICAgICAgICAgICAgYXJjaGl2ZS5zYXZlKG91dHB1dCkKICAgICAgICBleGNlcHQgRXhjZXB0aW9uIGFzIGU6CiAgICAgICAgICAgIHByaW50KCdDb3VsZCBub3Qgc2F2ZSBhcmNoaXZlIGZpbGU6IHswfScuZm9ybWF0KGUpLCBmaWxlPXN5cy5zdGRlcnIpCiAgICBlbGlmIGFyZ3VtZW50cy5kZWxldGU6CiAgICAgICAgIyBJdGVyYXRlIG92ZXIgdGhlIGdpdmVuIGZpbGVzIHRvIGRlbGV0ZSBmcm9tIHRoZSBhcmNoaXZlLgogICAgICAgIGZvciBmaWxlbmFtZSBpbiBhcmd1bWVudHMuZmlsZXM6CiAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgIGFyY2hpdmUucmVtb3ZlKGZpbGVuYW1lKQogICAgICAgICAgICBleGNlcHQgRXhjZXB0aW9uIGFzIGU6CiAgICAgICAgICAgICAgICBwcmludCgnQ291bGQgbm90IGRlbGV0ZSBmaWxlIHswfSBmcm9tIGFyY2hpdmU6IHsxfScuZm9ybWF0KGZpbGVuYW1lLCBlKSwgZmlsZT1zeXMuc3RkZXJyKQoKICAgICAgICAjIFNldCB2ZXJzaW9uIGZvciBzYXZpbmcsIGFuZCBzYXZlLgogICAgICAgIGFyY2hpdmUudmVyc2lvbiA9IHZlcnNpb24KICAgICAgICB0cnk6CiAgICAgICAgICAgIGFyY2hpdmUuc2F2ZShvdXRwdXQpCiAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBlOgogICAgICAgICAgICBwcmludCgnQ291bGQgbm90IHNhdmUgYXJjaGl2ZSBmaWxlOiB7MH0nLmZvcm1hdChlKSwgZmlsZT1zeXMuc3RkZXJyKQogICAgZWxpZiBhcmd1bWVudHMuZXh0cmFjdDoKICAgICAgICAjIEVpdGhlciBleHRyYWN0IHRoZSBnaXZlbiBmaWxlcywgb3IgYWxsIGZpbGVzIGlmIG5vIGZpbGVzIGFyZSBnaXZlbi4KICAgICAgICBpZiBsZW4oYXJndW1lbnRzLmZpbGVzKSA+IDA6CiAgICAgICAgICAgIGZpbGVzID0gYXJndW1lbnRzLmZpbGVzCiAgICAgICAgZWxzZToKICAgICAgICAgICAgZmlsZXMgPSBhcmNoaXZlLmxpc3QoKQoKICAgICAgICAjIENyZWF0ZSBvdXRwdXQgZGlyZWN0b3J5IGlmIG5vdCBwcmVzZW50LgogICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhvdXRwdXQpOgogICAgICAgICAgICBvcy5tYWtlZGlycyhvdXRwdXQpCgogICAgICAgICMgSXRlcmF0ZSBvdmVyIGZpbGVzIHRvIGV4dHJhY3QuCiAgICAgICAgZm9yIGZpbGVuYW1lIGluIGZpbGVzOgogICAgICAgICAgICBpZiBmaWxlbmFtZS5maW5kKCc9JykgIT0gLTE6CiAgICAgICAgICAgICAgICAob3V0ZmlsZSwgZmlsZW5hbWUpID0gZmlsZW5hbWUuc3BsaXQoJz0nLCAyKQogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgb3V0ZmlsZSA9IGZpbGVuYW1lCgogICAgICAgICAgICB0cnk6CiAgICAgICAgICAgICAgICBjb250ZW50cyA9IGFyY2hpdmUucmVhZChmaWxlbmFtZSkKCiAgICAgICAgICAgICAgICAjIENyZWF0ZSBvdXRwdXQgZGlyZWN0b3J5IGZvciBmaWxlIGlmIG5vdCBwcmVzZW50LgogICAgICAgICAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKG9zLnBhdGguZGlybmFtZShvcy5wYXRoLmpvaW4ob3V0cHV0LCBvdXRmaWxlKSkpOgogICAgICAgICAgICAgICAgICAgIG9zLm1ha2VkaXJzKG9zLnBhdGguZGlybmFtZShvcy5wYXRoLmpvaW4ob3V0cHV0LCBvdXRmaWxlKSkpCgogICAgICAgICAgICAgICAgd2l0aCBvcGVuKG9zLnBhdGguam9pbihvdXRwdXQsIG91dGZpbGUpLCAnd2InKSBhcyBmaWxlOgogICAgICAgICAgICAgICAgICAgIGZpbGUud3JpdGUoY29udGVudHMpCiAgICAgICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZToKICAgICAgICAgICAgICAgIHBhc3MKICAgIGVsaWYgYXJndW1lbnRzLmxpc3Q6CiAgICAgICAgIyBQcmludCB0aGUgc29ydGVkIGZpbGUgbGlzdC4KICAgICAgICBsaXN0ID0gYXJjaGl2ZS5saXN0KCkKICAgICAgICBsaXN0LnNvcnQoKQogICAgICAgIGZvciBmaWxlIGluIGxpc3Q6CiAgICAgICAgICAgIHByaW50KGZpbGUpCiAgICBlbHNlOgogICAgICAgIHByaW50KCdObyBvcGVyYXRpb24gZ2l2ZW4gOignKQogICAgICAgIHByaW50KCdVc2UgezB9IC0taGVscCBmb3IgdXNhZ2UgZGV0YWlscy4nLmZvcm1hdChzeXMuYXJndlswXSkpCg==
REM --------------------------------------------------------------------------------
REM SLDR Rogue-Like cheat.py (4864 chars max)
REM --------------------------------------------------------------------------------
set cheat1=aW1wb3J0IHJlCgp0YWIgPSAiICIgKiA0Cm5ld2xpbmUgPSAiXG4iCgoKZGVmIHNjcmVlbnMoKToKICAgIHdpdGggb3Blbigic2NyZWVucy5ycHkiLCAiciIpIGFzIGZpbGU6CiAgICAgICAgc2NyZWVucyA9IGZpbGUucmVhZCgpCiAgICBpZiAiQ2hlYXRzIGVuYWJsZWQhIiBpbiBzY3JlZW5zOgogICAgICAgIHJldHVybiBUcnVlCgogICAgbW1CYXNlID0gIlF1aXQoY29uZmlybT1GYWxzZSkiCiAgICBtbU5ldyA9ICgKICAgICAgICAnJXNcblxuICAgIGZyYW1lOlxuICAgICAgICB4YWxpZ24gLjUnCiAgICAgICAgJ1xuICAgICAgICB0ZXh0KCJDaGVhdHMgZW5hYmxlZCEiKVxuJyAlIG1tQmFzZQogICAgKQoKICAgIGludkJhc2UgPSAndGV4dCAiSW52ZW50b3J5OiIgc2l6ZSAyMCcKICAgIGludk5ldyA9ICgKICAgICAgICAnJXNcbiAgICAgICAgdGV4dGJ1dHRvbiAiKyAkMTAwMCIgdGV4dF9zaXplIDE1JwogICAgICAgICcgYWN0aW9uIFNldEZpZWxkKFBsYXllciwgIkNhc2giLCBQbGF5ZXIuQ2FzaCArIDEwMDApJyAlIGludkJhc2UKICAgICkKCiAgICBuYW1lcyA9IFsKICAgICAgICAiUGxheWVyIiwKICAgICAgICAiUm9ndWVYIiwKICAgICAgICAiS2l0dHlYIiwKICAgICAgICAiRW1tYVgiLAogICAgICAgICJMYXVyYVgiLAogICAgICAgICJKZWFuWCIsCiAgICAgICAgIlN0b3JtWCIsCiAgICAgICAgIkp1YmVzWCIsCiAgICAgICAgIkd3ZW5YIiwKICAgIF0KCiAgICBmb3IgaSBpbiBuYW1lczoKICAgICAgICBpbnZMZXZlbCA9ICgKICAgICAgICAgICAgJ1xuICAgICAgICBpZiAlcy5MdmwgPCAxMDpcbiAgICAgICAgICAgIHRleHRidXR0b24gIiVzIE1heCBMZXZlbCInCiAgICAgICAgICAgICcgdGV4dF9zaXplIDE1IGFjdGlvbiBbIFNldEZpZWxkKCVzLCAiTHZsIiwgMTApLCcKICAgICAgICAgICAgJyBTZXRGaWVsZCglcywgIlhQIiwgMzMzMCksIFNldEZpZWxkKCVzLCAiU3RhdFBvaW50cyIsIDEwKSBdJwogICAgICAgICAgICAlIChpLCAoaVs6LTFdIGlmIGlbLTFdID09ICJYIiBlbHNlIGkpLCBpLCBpLCBpKQogICAgICAgICkKICAgICAgICBpbnZOZXcgKz0gaW52TGV2ZWwKCiAgICBpbnZOZXcgKz0gKAogICAgICAgICdcbiAgICAgICAgaWYgIlhhdmllclwncyBwaG90byIgbm90IGluIFBsYXllci5JbnZlbnRvcnkgYW5kICJYYXZpZXJcJ3MgZmlsZXMiJwogICAgICAgICcgbm90IGluIFBsYXllci5JbnZlbnRvcnk6JwogICAgICAgICdcbiAgICAgICAgICAgIHRleHRidXR0b24gIkdpdmUgWGF2aWVyIEJsYWNrbWFpbCBJdGVtcyIgdGV4dF9zaXplIDE1JwogICAgICAgICcgYWN0aW9uIFsgQWRkVG9TZXQoUGxheWVyLkludmVudG9yeSwgIlhhdmllclwncyBwaG90byIpLCcKICAgICAgICAnIEFkZFRvU2V0KFBsYXllci5JbnZlbnRvcnksICgiWGF2aWVyXCdzIGZpbGVzIikpIF0nCiAgICApCgogICAgY2xvY2tCYXNlID0gJ2hvdmVyICJpbWFnZXMvQ2xvY2tmYWNlLnBuZyIgYWN0aW9uIE51bGxBY3Rpb24oKScKICAgIGNsb2NrTmV3ID0gJ2hvdmVyICJpbWFnZXMvQ2xvY2tmYWNlLnBuZyIgYWN0aW9uIFNldFZhcmlhYmxlKCJSb3VuZCIsIDEwMCknCgogICAgc2NyZWVucyA9ICgKICAgICAgICBzY3JlZW5zLnJlcGxhY2UobW1CYXNlLCBtbU5ldykKICAgICAgICAucmVwbGFjZShpbnZCYXNlLCBpbnZOZXcpCiAgICAgICAgLnJlcGxhY2UoY2xvY2tCYXNlLCBjbG9ja05ldykKICAgICkKCiAgICBvYmplY3RzID0gWyJQYXJ0bmVyIiwgIkNoX0ZvY3VzIl0KCiAgICBmb3IgaSBpbiBvYmplY3RzOgogICAgICAgIGx1c3RCYXNlID0gInZhbHVlICVzLkx1c3QiICUgaQogICAgICAgIGx1c3ROZXcgPSAndmFsdWUgRmllbGRWYWx1ZSglcywgIkx1c3QiLCAxMDApJyAlIGkKCiAgICAgICAgbG92ZUJhc2UgPSAidmFsdWUgKCVzLkxvdmUvMTApIiAlIGkKICAgICAgICBsb3ZlTmV3ID0gJ3ZhbHVlIEZpZWxkVmFsdWUoJXMsICJMb3ZlIiwgMTAwMCknICUgaQoKICAgICAgICBvYmVkQmFzZSA9ICJ2YWx1ZSAoJXMuT2JlZC8xMCkiICUgaQogICAgICAgIG9iZWROZXcgPSAndmFsdWUgRmllbGRWYWx1ZSglcywgIk9iZWQiLCAxMDAwKScgJSBpCgogICAgICAgIGluYnRCYXNlID0gInZhbHVlICglcy5JbmJ0LzEwKSIgJSBpCiAgICAgICAgaW5idE5ldyA9ICd2YWx1ZSBGaWVsZFZhbHVlKCVzLCAiSW5idCIsIDEwMDApJyAlIGkKCiAgICAgICAgYWRkaWN0QmFzZSA9ICJ2YWx1ZSAlcy5BZGRpY3QiICUgaQogICAgICAgIGFkZGljdE5ldyA9ICd2YWx1ZSBGaWVsZFZhbHVlKCVzLCAiQWRkaWN0IiwgMTAwKScgJSBpCgogICAgICAgIHJhdGVCYXNlID0gInZhbHVlICglcy5BZGRpY3Rpb25yYXRlKjEwKSIgJSBpCiAgICAgICAgcmF0ZU5ldyA9ICd2YWx1ZSBGaWVsZFZhbHVlKCVzLCAiQWRkaWN0aW9ucmF0ZSIsIDEwKScgJSBpCgogICAgICAgIHNjcmVlbnMgPSAoCiAgICAgICAgICAgIHNjcmVlbnMucmVwbGFjZShsb3ZlQmFzZSwgbG92ZU5ldykKICAgICAgICAgICAgLnJlcGxhY2UobHVzdEJhc2UsIGx1c3ROZXcpCiAgICAgICAgICAgIC5yZXBsYWNlKG9iZWRCYXNlLCBvYmVkTmV3KQogICAgICAgICAgICAucmVwbGFjZShhZGRpY3RCYXNlLCBhZGRpY3ROZXcpCiAgICAgICAgICAgIC5yZXBsYWNlKGluYnRCYXNlLCBpbmJ0TmV3KQogICAgICAgICAgICAucmVwbGFjZShyYXRlQmFzZSwgcmF0ZU5ldykKICAgICAgICApCgogICAgZm9jdXNCYXNlID0gInZhbHVlIFBsYXllci5Gb2N1cyIKICAgIGZvY3VzTmV3ID0gJ3ZhbHVlIEZpZWxkVmFsdWUoUGxheWVyLCAiRm9jdXMiLCAxMDApJwoKICAgIHNlbWVuQmFzZSA9ICJ2YWx1ZSAoUGxheWVyLlNlbWVuKjIwKSIKICAgIHNlbWVuTmV3ID0gJ3ZhbHVlIEZpZWxkVmFsdWUoUGxheWVyLCAiU2VtZW4iLCA1KScKCiAgICBzY3JlZW5zID0gKAogICAgICAgIHNjcmVlbnMucmVwbGFjZShmb2N1c0Jhc2UsIGZvY3VzTmV3KQogICAgICAgIC5yZXBsYWNlKGZvY3VzQmFzZSwgZm9jdXNOZXcpCiAgICAgICAgLnJlcGxhY2Uoc2VtZW5CYXNlLCBzZW1lbk5ldykKICAgICkKCiAgICBzY3JlZW5zID0gcmUuc3ViKAogICAgICAgICIgICAgICAgIGJ1dHRvbjpcbiAgICAgICAgICAgICAgICAjYnV0dG9uIHRvIGNvbnRyb2wgd2hldGhlciBjb2NrIGlzIHZpc2libGUgb3Igbm90XG4uKlxuLipcbi4qIiwKICAgICAgICAiIiwKICAgICAgICBzY3JlZW5zLAogICAgKQoKICAgIHdpdGggb3Blbigic2NyZWVucy5ycHkiLCAidyIpIGFzIGZpbGU6CiAgICAgICAgZmlsZS53cml0ZShzY3JlZW5zKQoKICAgIHJldHVybiBGYWxzZQoKCmRlZiBvcHRpb25zKCk6CiAgICB3aXRoIG9wZW4oIm9wdGlvbnMucnB5IiwgInIiKSBhcyBmaWxlOgogICAgICAgIG9wdGlvbnMgPSBmaWxlLnJlYWQoKQoKICAgIGNvbnNvbGVCYXNlID0gImNvbmZpZy5kZXZlbG9wZXIgPSBGYWxzZSIKICAgIGNvbnNvbGVOZXcgPSAiJXNcbiAgICBjb25maWcuY29uc29sZSA9IFRydWUiICUgY29uc29sZUJhc2UKCiAgICBvcHRpb25zID0gb3B0aW9ucy5yZXBsYWNlKGNvbnNvbGVCYXNlLCBjb25zb2xlTmV3KQoKICAgIHdpdGggb3Blbigib3B0aW9ucy5ycHkiLCAidyIpIGFzIGZpbGU6CiAgICAgICAgZmlsZS53cml0ZShvcHRpb25zKQoKICAgIHJldHVybgoKCmlmIHNjcmVlbnMoKToKICAgIHByaW50KAogICAgICAgICJD
set cheat2=aGVhdHMgaGF2ZSBiZWVuIGRldGVjdGVkIVxuSWYgdGhpcyBpcyBhbiB1bmV4cGVjdGVkIGVycm9yLCIKICAgICAgICAiIHBsZWFzZSB0cnkgYWdhaW4gb24gYSBmcmVzaGx5IHVuemlwcGVkIHZlcnNpb24gb2YgUm9ndWUtTGlrZSEiCiAgICApCmVsc2U6CiAgICBwcmludCgKICAgICAgICAiXG4gICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqIgogICAgICAgICJcbiAgICBFbmFibGluZyBpbnZlbnRvcnkgYW5kIHN0YXQgY2hlYXRzLi4uXG4iCiAgICApCgogICAgb3B0aW9ucygpCiAgICBwcmludCgiICAgIEVuYWJsaW5nIGRldmVsb3BlciBjb25zb2xlLi4uXG4iKQoKICAgIHByaW50KAogICAgICAgICIgICAgU3VjY2VzcyEgQ2hlYXRzIGFyZSBub3cgZW5hYmxlZCEiCiAgICAgICAgIlxuICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiIKICAgICkK
REM --------------------------------------------------------------------------------
REM !! DO NOT EDIT BELOW THIS LINE !!
REM --------------------------------------------------------------------------------
set "version=1.5"
title RL Inject v%version%
:init
REM --------------------------------------------------------------------------------
REM Splash screen
REM --------------------------------------------------------------------------------
cls
echo.
echo     ____    __       ____        _           __ 
echo    / __ \  / /      /  _/___    (_)__  _____/ /_
echo   / /_/ / / /       / // __ \  / / _ \/ ___/ __/
echo  / _^, _/ / /___   _/ // / / / / /  __/ /__/ /_  
echo /_/ ^|_^| /_____/  /___/_/ /_/_/ /\___/\___/\__/  v%version%
echo                           /___/                 
echo   SLDR @ F95zone.com
echo   Built on UnRen v0.7 by Sam
echo.
echo   What's new for v%version%?
echo       * Added Gwen
echo.
echo  ----------------------------------------------------
echo.

REM --------------------------------------------------------------------------------
REM We need powershell for later, make sure it exists
REM --------------------------------------------------------------------------------
if not exist "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe" (
	echo    ! Error: Powershell is required, unable to continue.
	echo             This is included in Windows 7, 8, 10. XP/Vista users can
	echo             download it here: http://support.microsoft.com/kb/968929
	echo.
	pause>nul|set/p=.            Press any key to exit...
	exit
)

REM --------------------------------------------------------------------------------
REM Set our paths, and make sure we can find python exe
REM --------------------------------------------------------------------------------
set "currentdir=%~dp0%"
set "pythondir=%currentdir%..\lib\windows-i686\"
set "renpydir=%currentdir%..\renpy\"
set "gamedir=%currentdir%"
if exist "game" if exist "lib" if exist "renpy" (
	set "pythondir=%currentdir%lib\windows-i686\"
	set "renpydir=%currentdir%renpy\"
	set "gamedir=%currentdir%game\"
)

if not exist "%pythondir%python.exe" (
	echo    ! Error: Cannot locate python.exe, unable to continue.
	echo             Are you sure we're in the game's root directory?
	echo.
	pause>nul|set/p=.            Press any key to exit...
	exit
)

:menu
REM --------------------------------------------------------------------------------
REM Menu selection
REM --------------------------------------------------------------------------------
set exitoption=
echo   Available Options:
echo     1) ENABLE cheats
echo     2) DISABLE cheats
echo.
set /p option=.  Enter a number: 
echo.
echo  ----------------------------------------------------
echo.
if "%option%" == "2" (
    goto extract
)
if exist "%gamedir%options.rpy" (
    if exist "%gamedir%screens.rpy" (
        goto cheat
    )
)

:extract
REM --------------------------------------------------------------------------------
REM Write _rpatool.py from our base64 strings
REM --------------------------------------------------------------------------------
set "rpatool=%currentdir%_rpatool.py"
echo   Creating rpatool...
if exist "%rpatool%.tmp" (
	del "%rpatool%.tmp"
)
if exist "%rpatool%" (
	del "%rpatool%"
)

echo %rpatool1%>> "%rpatool%.tmp"
echo %rpatool2%>> "%rpatool%.tmp"
echo %rpatool3%>> "%rpatool%.tmp"
echo %rpatool4%>> "%rpatool%.tmp"
echo %rpatool5%>> "%rpatool%.tmp"
set "rpatoolps=%rpatool:[=`[%"
set "rpatoolps=%rpatoolps:]=`]%"
set "rpatoolps=%rpatoolps:^=^^%"
set "rpatoolps=%rpatoolps:&=^&%"
powershell.exe -nologo -noprofile -noninteractive -command "& { [IO.File]::WriteAllBytes(\"%rpatoolps%\", [Convert]::FromBase64String([IO.File]::ReadAllText(\"%rpatoolps%.tmp\"))) }"

echo.

REM --------------------------------------------------------------------------------
REM Unpack RPA
REM --------------------------------------------------------------------------------
echo   Searching for RPA packages
cd "%gamedir%"
set "PYTHONPATH=%pythondir%Lib"
for %%f in (*.rpa) do (
	echo    + Unpacking "%%~nf%%~xf" - %%~zf bytes
	"%pythondir%python.exe" -O "%rpatool%" -x "%%f" "screens.rpy" "options.rpy"
)
echo.

REM --------------------------------------------------------------------------------
REM Clean up
REM --------------------------------------------------------------------------------
echo   Cleaning up temporary files...
del "%rpatool%.tmp"
del "%rpatool%"
echo.
if "%option%" == "2" (
	goto finish
)

:cheat
REM --------------------------------------------------------------------------------
REM Make sure cheat.py doesn't already exist
REM --------------------------------------------------------------------------------
set "cheat=%currentdir%_cheat.py"
echo   Creating cheat...
if exist "%cheat%.tmp" (
	del "%cheat%.tmp"
)
if exist "%cheat%" (
	del "%cheat%"
)

REM --------------------------------------------------------------------------------
REM Create cheat.py
REM --------------------------------------------------------------------------------
echo %cheat1%>> "%cheat%.tmp"
echo %cheat2%>> "%cheat%.tmp"
set "cheatps=%cheat:[=`[%"
set "cheatps=%cheatps:]=`]%"
set "cheatps=%cheatps:^=^^%"
set "cheatps=%cheatps:&=^&%"
powershell.exe -nologo -noprofile -noninteractive -command "& { [IO.File]::WriteAllBytes(\"%cheatps%\", [Convert]::FromBase64String([IO.File]::ReadAllText(\"%cheatps%.tmp\"))) }"

REM --------------------------------------------------------------------------------
REM Run cheat.py
REM --------------------------------------------------------------------------------
cd "%gamedir%"
"%pythondir%python.exe" -O "%cheat%"

echo.

REM --------------------------------------------------------------------------------
REM Delete temporary files
REM --------------------------------------------------------------------------------
echo   Cleaning up temporary files...
del "%cheat%.tmp"
del "%cheat%"
echo.
goto finish


:finish
REM --------------------------------------------------------------------------------
REM We are done
REM --------------------------------------------------------------------------------
echo  ----------------------------------------------------
echo.
echo    Finished!
echo.
echo    Enter "1" to go back to the menu, or any other
set /p exitoption=.   key to exit: 
echo.
echo  ----------------------------------------------------
echo.
if "%exitoption%"=="1" goto menu
exit
