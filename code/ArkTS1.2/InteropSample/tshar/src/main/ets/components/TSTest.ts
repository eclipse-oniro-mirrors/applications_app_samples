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

export const SUBJECT = new Set(['语文', '数学', '英语', '物理', '化学', '生物']);

export class Student {
  public name: string = '';
  public age: number = 18;
  public sex: string = '';
  public isBoarder: boolean = true;
  public transcript: Map<string, number> = new Map<string, number>();

  constructor(name: string, age: number, sex: string, isBoarder: boolean) {
    this.name = name;
    this.age = age;
    this.sex = sex;
    this.isBoarder = isBoarder;
  }

  introduce(): string {
    let boarderStatus: string = this.isBoarder ? 'boarding student' : 'day student';
    return `姓名${this.name},今年${this.age}岁,是一名${boarderStatus}`;
  }

  setSubjectScore(subject: string, score: number): void {
    if (score < 0 && score > 100) {
      throw new Error();
    }
    this.transcript.set(subject, score);
  }
}

export function calTotalScore(student: Student) {
  let total: number = 0;
  for (let score of student.transcript.values()) {
    total += score;
  }
  return total;
}

export function calAverageScore(totalScore: number, subjectCount: number) {
  if (subjectCount === 0) {
    throw new Error();
  }
  let averageScore: number = totalScore / subjectCount;
  let averageScoreStr: string = String(Math.round(averageScore * 100) / 100);
  return averageScoreStr;
}

// 7.异常处理
export function referenceErr(): string {
  let referenceErr: ReferenceError = new ReferenceError('reference error');
  let errorInfo = referenceErr.message;
  return errorInfo;
}