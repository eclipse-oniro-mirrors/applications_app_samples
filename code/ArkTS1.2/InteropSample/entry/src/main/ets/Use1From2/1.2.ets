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

export function test(): Array<string> {
  let logs: string[] = new Array<string>();
  // 1.文件导入
  const module =
    ESObject.load('@normalized:N&entry&com.samples.interopsample&arkts1_0har/src/main/ets/components/ArkTSVersion_1&1.0.0');
  let student = module.getProperty('Student');
  const SUBJECT = module.getProperty('SUBJECT');
  // 2.类实例化
  let argName: string = 'A';
  let argSex: string = 'M';
  let argstudentID: short = 1001;
  let argAge: byte = 18;
  let argHeight: int = 175;
  let argPhone: long = 13820002025;
  let argAverageGrade: float = 81.75;
  let arggradePoint: double = 3.85;
  let argIsBoarder: boolean = false;
  let student1 =
    student.instantiate(ESObject.wrapString(argName), ESObject.wrapString(argSex), ESObject.wrapShort(argstudentID),
      ESObject.wrapByte(argAge),
      ESObject.wrapInt(argHeight),
      ESObject.wrapLong(argPhone), ESObject.wrapFloat(argAverageGrade), ESObject.wrapDouble(arggradePoint),
      ESObject.wrapBoolean(argIsBoarder));
  let score = [75, 68, 80, 90, 92, 78];
  let index = 0;
  for (let item of SUBJECT) {
    student1.invokeMethod('setSubjectScore', item, score[index]);
    index++;
  }
  // 3.属性读写
  let name = student1.getProperty('name').toString();
  let age = student1.getProperty('age').toNumber();
  let sex = student1.getProperty('sex').toString();
  let isBoarder = student1.getProperty('isBoarder').toBoolean();
  logs.push(`${name}的年龄为${age}岁。`);
  student1.setProperty('age', 20);
  let newAge = student1.getProperty('age').toNumber();
  logs.push(`更新${name}的年龄为${newAge}岁。`);
  // 5.对象方法调用
  logs.push(`${name}的个人信息: ${student1.invokeMethod('introduce')}`);
  // 4.函数调用
  let calTotalScore = module.getProperty('calTotalScore');
  let calAverageScore = module.getProperty('calAverageScore');
  let totalScore = calTotalScore.invoke(student1).toNumber();
  // 6.参数传递
  let averageScore = calAverageScore.invoke(ESObject.wrapNumber(totalScore), ESObject.wrapNumber(6));
  logs.push(`总成绩:${totalScore},平均分:${averageScore}`);
  return logs;
}

// 7.异常
export function ErrorHandle(): string {
  const module =
    ESObject.load('@normalized:N&entry&com.samples.interopsample&arkts1_0har/src/main/ets/components/ArkTSVersion_1&1.0.0');
  let referenceErr = module.getProperty('referenceErr');
  let errorInfo = referenceErr.invoke().toString();
  return errorInfo;
}