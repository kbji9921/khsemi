<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 등록</title>
    <style>
        .insert{
            width: 1000px;
            height: 800px;
        }
    </style>
</head>
<body>
    <form action="insert.kh" method="post">
    <div class="Container w800 m30">
        <div class="row id center">
            <label>
                아이디
                <input type="text" name="trainerId" autocomplete="off" required placeholder="8~21">
            </label>
        </div>
        <div class="pw">
            <label>
                비밀번호
                <input type="password" name="trainerPw" required>
            </label>
        </div>
        <div class="name">
            <label>
                이름
                <input type="text" name="trainerName" autocomplete="off" placeholder="2~7" required>
            </label>
        </div>
        <div class="birth">
            <label>
                생년월일
                <input type="date" name="trainerBirth" autocomplete="off" required>
            </label>
        </div>
        <div class="phone">
            <label>
                전화번호
                <input type="number" name="trainerPhone" autocomplete="off" placeholder="number only" required>
            </label>
        </div>
        <div class="email">
            <label>
                이메일
                <input type="email" name="trainerEmail" autocomplete="off" placeholder="8~20" required>
            </label>
        </div>
           <div class="email">
            <label>
                성별
                <input type="text" name="trainerGender" autocomplete="off" placeholder="성별: 남/여" required>
            </label>
        </div>
           <div class="email">
            <label>
                운동 종목
                <input type="text" name="trainerSports" autocomplete="off" placeholder="운동종목" required>
            </label>
        </div>
        <div class="row">
        	<button type="submit">회원가입</button>
        </div>
    </div>
    </form>
</body>
</html>