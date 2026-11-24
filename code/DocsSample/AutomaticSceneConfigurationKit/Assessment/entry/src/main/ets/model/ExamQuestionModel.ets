/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export default class ExamQuestionModel {
  public type: string = 'choice';
  public stem: Resource;
  public options: Resource[];
  public answerIndex: number;
  public correctAnswer: string = '';

  constructor(stem: Resource, options: Resource[], answerIndex: number, type?: string, correctAnswer?: string) {
    this.stem = stem;
    this.options = options;
    this.answerIndex = answerIndex;
    if (type !== undefined) {
      this.type = type;
    }
    if (correctAnswer !== undefined) {
      this.correctAnswer = correctAnswer;
    }
  }
}

export class ExamRepository {
  public static getQuestions(): ExamQuestionModel[] {
    const questions: ExamQuestionModel[] = [];
    questions.push(new ExamQuestionModel($r('app.string.question_stem_4'), [], -1, 'fill', 'SoftBus'));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_5'), [], -1, 'fill', '@Trace'));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_1'), [
      $r('app.string.question_option_1_1'),
      $r('app.string.question_option_1_2'),
      $r('app.string.question_option_1_3')
    ], 0));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_2'), [
      $r('app.string.question_option_2_1'),
      $r('app.string.question_option_2_2'),
      $r('app.string.question_option_2_3')
    ], 1));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_3'), [
      $r('app.string.question_option_3_1'),
      $r('app.string.question_option_3_2'),
      $r('app.string.question_option_3_3')
    ], 2));
    return questions;
  }
}
