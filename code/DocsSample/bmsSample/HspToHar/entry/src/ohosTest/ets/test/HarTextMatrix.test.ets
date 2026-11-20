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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function harTextMatrixTest() {
  describe('harTextMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });


  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HARTXT_0002
   * @tc.name      testHarText0002
   * @tc.desc      Hsp text 2 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarText0002', 'text 2');
    const text: string = 'simple008_hsp_to_har';
    expect(text.length).assertEqual(20);
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split('_').length).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('SIMPLE008_HSP_TO_HAR');
    expect(text.toLowerCase()).assertEqual('simple008_hsp_to_har');
    expect(text.replace(' ', '-')).assertEqual('simple008_hsp_to_har');
    expect(text.padStart(24, '.')).assertEqual('....simple008_hsp_to_har');
    expect(text.trim()).assertEqual(text);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HARTXT_0003
   * @tc.name      testHarText0003
   * @tc.desc      Hsp text 3 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarText0003', 'text 3');
    const text: string = 'page_text_font_size';
    expect(text.length).assertEqual(19);
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split('_').length).assertEqual(4);
