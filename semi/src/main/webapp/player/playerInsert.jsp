<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등록</title>
    <style>
        .insert{
            width: 1000px;
            height: 800px;
        }
    </style>
</head>
<body>
    <form action="insert.player" method="post">
    <div class="insert">
        <div class="id center">
            <label>
                ID
                <input type="text" name="playerId" autocomplete="off" required placeholder="8~21">
            </label>
        </div>
        <div class="pw">
            <label>
                PW
                <input type="password" name="playerPw" required>
            </label>
        </div>
        <div class="name">
            <label>
                Name
                <input type="text" name="playerName" autocomplete="off" placeholder="2~7" required>
            </label>
        </div>
        <div class="birth">
            <label>
                Birth
                <input type="date" name="playerBirth" autocomplete="off" required>
            </label>
        </div>
        <div class="phone">
            <label>
                phone
                <input type="number" name="playerPhone" autocomplete="off" placeholder="number only" required>
            </label>
        </div>
        <div class="email">
            <label>
                Email
                <input type="email" name="playerEmail" autocomplete="off" placeholder="8~20" required>
            </label>
        </div>
        <div class="right">
        	<input type="submit" value="join">
        </div>
    </div>
    </form>
</body>
</html>