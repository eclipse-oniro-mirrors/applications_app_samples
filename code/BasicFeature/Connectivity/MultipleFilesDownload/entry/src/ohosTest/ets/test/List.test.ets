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

import downloadDataMatrixPart1Test from './DownloadDataMatrixPart1.test';
import downloadDataMatrixPart2Test from './DownloadDataMatrixPart2.test';
import downloadDataMatrixPart3Test from './DownloadDataMatrixPart3.test';
import downloadDataMatrixPart4Test from './DownloadDataMatrixPart4.test';
import downloadDataMatrixPart5Test from './DownloadDataMatrixPart5.test';
import downloadDataMatrixPart6Test from './DownloadDataMatrixPart6.test';
import downloadDataMatrixPart7Test from './DownloadDataMatrixPart7.test';
import downloadDataMatrixPart8Test from './DownloadDataMatrixPart8.test';
import downloadDataDefaultsPart1Test from './DownloadDataDefaultsPart1.test';
import fileNameMatrixPart1Test from './FileNameMatrixPart1.test';
import fileNameMatrixPart2Test from './FileNameMatrixPart2.test';
import fileNameMatrixPart3Test from './FileNameMatrixPart3.test';
import fileNameMatrixPart4Test from './FileNameMatrixPart4.test';
import formatTimeMatrixPart1Test from './FormatTimeMatrixPart1.test';
import formatTimeMatrixPart2Test from './FormatTimeMatrixPart2.test';
import formatTimeMatrixPart3Test from './FormatTimeMatrixPart3.test';
import formatTimeMatrixPart4Test from './FormatTimeMatrixPart4.test';
import formatTimeEdgesPart1Test from './FormatTimeEdgesPart1.test';
import loggerVariadicPart1Test from './LoggerVariadicPart1.test';
import loggerVariadicPart2Test from './LoggerVariadicPart2.test';
import loggerVariadicPart3Test from './LoggerVariadicPart3.test';
import abilityTest from './Ability.test';

export default function testsuite() {
  abilityTest();
  downloadDataMatrixPart1Test();
  downloadDataMatrixPart2Test();
  downloadDataMatrixPart3Test();
  downloadDataMatrixPart4Test();
  downloadDataMatrixPart5Test();
  downloadDataMatrixPart6Test();
  downloadDataMatrixPart7Test();
  downloadDataMatrixPart8Test();
  downloadDataDefaultsPart1Test();
  fileNameMatrixPart1Test();
  fileNameMatrixPart2Test();
  fileNameMatrixPart3Test();
  fileNameMatrixPart4Test();
  formatTimeMatrixPart1Test();
  formatTimeMatrixPart2Test();
  formatTimeMatrixPart3Test();
  formatTimeMatrixPart4Test();
  formatTimeEdgesPart1Test();
  loggerVariadicPart1Test();
  loggerVariadicPart2Test();
  loggerVariadicPart3Test();
}