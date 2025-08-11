'use static'
/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// 1.文件导入
import { referenceErr, Student, SUBJECT, calTotalScore, calAverageScore } from 'arkts1_2har';

export function test2(): Array<string> {
  let logs: string[] = new Array<string>();
  let argName = 'B';
  let argSex = 'M';
  let argstudentID = 1002;
  let argAge = 18;
  let argHeight = 175;
  let argPhone = 13820002025;
  let argAverageGrade = 81;
  let arggradePoint = 3.85;
  let argIsBoarder = false;
  // 2.类实例化
  let student1 = new Student('B', 'M', 1002, 18, 175, 13820002025, 81, 3.85, true);
  let score = [70, 68, 80, 90, 92, 78];
  let index = 0;
  for (let item of SUBJECT) {
    student1.setSubjectScore(item, score[index]);
    index++;
  }
  // 3.属性读写
  logs.push(`${student1.name}的年龄为${student1.age}岁。`);
  let newAge = student1.age = 19;
  logs.push(`更新${student1.name}的年龄为${newAge}岁。`);
  // 5.属性方法调用
  logs.push(`${student1.name}的个人信息: ${student1.introduce()}`);
  // 4.函数调用
  let totalScore = calTotalScore(student1);
  // 6.参数传递
  let averageScore = calAverageScore(totalScore, SUBJECT.size);
  logs.push(`总成绩:${totalScore},平均分:${averageScore}`);
  return logs;
}

// 7.异常处理
export function ErrorHandle2(): string {
  let errorInfo = referenceErr.message;
  return errorInfo;
}