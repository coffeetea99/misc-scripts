:: 각 명령어들을 표시하지 않음
@echo off
:: 한국어 및 이모지 처리
chcp 65001 >nul
:: setlocal: set으로 선언한 변수를 endlocal까지만 유효하도록 함
:: enabledelayedexpansion: 일반적으로 for문이나 if문 안에서 변수를 변경하고 접근하면 바뀐 값으로 갱신되지 않음
:: 이걸 사용하면 바뀐 값으로 갱신되는데 변수를 %var% 로 받아오는 것이 아니라 !var! 로 받아와야 함
setlocal enabledelayedexpansion

:: 배치 파일의 for문 안에서는 변수에 접근할 때 앞에 %를 2개 붙여야 함
:: 배치 파일 말고 그냥 명령 프롬프트에서 사용할 때는 1개만 붙임
for %%f in (*.*) do (
    :: I라는 변수가 있을 때 ~nI는 파일 이름만 가져옴, 이런 걸 modifier라고 함
    set "filename=%%~nf"
    set "ext=%%~xf"

    set "newname=!filename:~0,-14!!ext!"

    if not "!newname!"=="!filename!!ext!" (
        echo Renaming "%%f" to "!newname!"
        ren "%%f" "!newname!"
    )
)

endlocal
