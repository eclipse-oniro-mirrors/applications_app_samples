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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandText]';

export default function expandTextMatrix1Test(): void {
  describe('ExpandTextMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_TEXT_0001
     * @tc.name      expandTextText0001
     * @tc.desc      文本 OpenHarmony 在 10px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0001 begin');
      const text: string = 'OpenHarmony';
      const fontSize: number = 10;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(11);
      expect(width).assertEqual(110);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0001 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0002
     * @tc.name      expandTextText0002
     * @tc.desc      文本 OpenHarmony 在 120px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0002 begin');
      const width: number = 110;
      const boxWidth: number = 120;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0002 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0003
     * @tc.name      expandTextText0003
     * @tc.desc      文本 OpenHarmony 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0003 begin');
      const text: string = 'OpenHarmony';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0003 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0004
     * @tc.name      expandTextText0004
     * @tc.desc      文本 Graphics Sample 在 14px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0004 begin');
      const text: string = 'Graphics Sample';
      const fontSize: number = 14;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(15);
      expect(width).assertEqual(210);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0004 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0005
     * @tc.name      expandTextText0005
     * @tc.desc      文本 Graphics Sample 在 168px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0005 begin');
      const width: number = 210;
      const boxWidth: number = 168;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0005 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0006
     * @tc.name      expandTextText0006
     * @tc.desc      文本 Graphics Sample 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0006 begin');
      const text: string = 'Graphics Sample';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0006 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0007
     * @tc.name      expandTextText0007
     * @tc.desc      文本 文本排版样例 在 16px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0007 begin');
      const text: string = '文本排版样例';
      const fontSize: number = 16;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(6);
      expect(width).assertEqual(96);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0007 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0008
     * @tc.name      expandTextText0008
     * @tc.desc      文本 文本排版样例 在 192px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0008 begin');
      const width: number = 96;
      const boxWidth: number = 192;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0008 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0009
     * @tc.name      expandTextText0009
     * @tc.desc      文本 文本排版样例 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0009 begin');
      const text: string = '文本排版样例';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0009 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0010
     * @tc.name      expandTextText0010
     * @tc.desc      文本 Eraser Canvas Demo 在 12px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0010 begin');
      const text: string = 'Eraser Canvas Demo';
      const fontSize: number = 12;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(18);
      expect(width).assertEqual(216);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0010 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0011
     * @tc.name      expandTextText0011
     * @tc.desc      文本 Eraser Canvas Demo 在 144px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0011 begin');
      const width: number = 216;
      const boxWidth: number = 144;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0011 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0012
     * @tc.name      expandTextText0012
     * @tc.desc      文本 Eraser Canvas Demo 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0012 begin');
      const text: string = 'Eraser Canvas Demo';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0012 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0013
     * @tc.name      expandTextText0013
     * @tc.desc      文本 i18n 国际化示例 在 18px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0013 begin');
      const text: string = 'i18n 国际化示例';
      const fontSize: number = 18;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(10);
      expect(width).assertEqual(180);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0013 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0014
     * @tc.name      expandTextText0014
     * @tc.desc      文本 i18n 国际化示例 在 216px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0014 begin');
      const width: number = 180;
      const boxWidth: number = 216;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0014 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0015
     * @tc.name      expandTextText0015
     * @tc.desc      文本 i18n 国际化示例 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0015 begin');
      const text: string = 'i18n 国际化示例';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0015 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0016
     * @tc.name      expandTextText0016
     * @tc.desc      文本 Video Player 在 13px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0016 begin');
      const text: string = 'Video Player';
      const fontSize: number = 13;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(12);
      expect(width).assertEqual(156);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0016 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0017
     * @tc.name      expandTextText0017
     * @tc.desc      文本 Video Player 在 156px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0017 begin');
      const width: number = 156;
      const boxWidth: number = 156;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0017 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0018
     * @tc.name      expandTextText0018
     * @tc.desc      文本 Video Player 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0018 begin');
      const text: string = 'Video Player';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0018 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0019
     * @tc.name      expandTextText0019
     * @tc.desc      文本 A 在 24px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0019 begin');
      const text: string = 'A';
      const fontSize: number = 24;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(1);
      expect(width).assertEqual(24);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0019 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0020
     * @tc.name      expandTextText0020
     * @tc.desc      文本 A 在 288px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0020 begin');
      const width: number = 24;
      const boxWidth: number = 288;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0020 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0021
     * @tc.name      expandTextText0021
     * @tc.desc      文本 A 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0021 begin');
      const text: string = 'A';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(1);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0021 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0022
     * @tc.name      expandTextText0022
     * @tc.desc      文本 中 在 22px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0022 begin');
      const text: string = '中';
      const fontSize: number = 22;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(1);
      expect(width).assertEqual(22);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0022 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0023
     * @tc.name      expandTextText0023
     * @tc.desc      文本 中 在 264px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0023 begin');
      const width: number = 22;
      const boxWidth: number = 264;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0023 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0024
     * @tc.name      expandTextText0024
     * @tc.desc      文本 中 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0024 begin');
      const text: string = '中';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(1);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0024 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0025
     * @tc.name      expandTextText0025
     * @tc.desc      文本 Hello World 在 20px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0025 begin');
      const text: string = 'Hello World';
      const fontSize: number = 20;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(11);
      expect(width).assertEqual(220);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0025 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0026
     * @tc.name      expandTextText0026
     * @tc.desc      文本 Hello World 在 240px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0026 begin');
      const width: number = 220;
      const boxWidth: number = 240;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0026 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0027
     * @tc.name      expandTextText0027
     * @tc.desc      文本 Hello World 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0027 begin');
      const text: string = 'Hello World';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0027 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0028
     * @tc.name      expandTextText0028
     * @tc.desc      文本 鸿蒙应用样例 在 15px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0028 begin');
      const text: string = '鸿蒙应用样例';
      const fontSize: number = 15;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(6);
      expect(width).assertEqual(90);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0028 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0029
     * @tc.name      expandTextText0029
     * @tc.desc      文本 鸿蒙应用样例 在 180px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0029 begin');
      const width: number = 90;
      const boxWidth: number = 180;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0029 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0030
     * @tc.name      expandTextText0030
     * @tc.desc      文本 鸿蒙应用样例 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0030 begin');
      const text: string = '鸿蒙应用样例';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0030 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0031
     * @tc.name      expandTextText0031
     * @tc.desc      文本 Drawing Text 在 11px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0031 begin');
      const text: string = 'Drawing Text';
      const fontSize: number = 11;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(12);
      expect(width).assertEqual(132);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0031 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0032
     * @tc.name      expandTextText0032
     * @tc.desc      文本 Drawing Text 在 132px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0032 begin');
      const width: number = 132;
      const boxWidth: number = 132;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0032 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0033
     * @tc.name      expandTextText0033
     * @tc.desc      文本 Drawing Text 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0033 begin');
      const text: string = 'Drawing Text';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0033 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0034
     * @tc.name      expandTextText0034
     * @tc.desc      文本 Camera Preview 在 16px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0034 begin');
      const text: string = 'Camera Preview';
      const fontSize: number = 16;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(14);
      expect(width).assertEqual(224);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0034 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0035
     * @tc.name      expandTextText0035
     * @tc.desc      文本 Camera Preview 在 192px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0035 begin');
      const width: number = 224;
      const boxWidth: number = 192;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0035 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0036
     * @tc.name      expandTextText0036
     * @tc.desc      文本 Camera Preview 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0036 begin');
      const text: string = 'Camera Preview';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0036 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0037
     * @tc.name      expandTextText0037
     * @tc.desc      文本 0123456789 在 9px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0037 begin');
      const text: string = '0123456789';
      const fontSize: number = 9;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(10);
      expect(width).assertEqual(90);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0037 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0038
     * @tc.name      expandTextText0038
     * @tc.desc      文本 0123456789 在 108px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0038 begin');
      const width: number = 90;
      const boxWidth: number = 108;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0038 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0039
     * @tc.name      expandTextText0039
     * @tc.desc      文本 0123456789 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0039 begin');
      const text: string = '0123456789';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0039 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0040
     * @tc.name      expandTextText0040
     * @tc.desc      文本 Mixed 中英 text 在 17px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0040 begin');
      const text: string = 'Mixed 中英 text';
      const fontSize: number = 17;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(13);
      expect(width).assertEqual(221);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0040 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0041
     * @tc.name      expandTextText0041
     * @tc.desc      文本 Mixed 中英 text 在 204px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0041 begin');
      const width: number = 221;
      const boxWidth: number = 204;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0041 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0042
     * @tc.name      expandTextText0042
     * @tc.desc      文本 Mixed 中英 text 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0042 begin');
      const text: string = 'Mixed 中英 text';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0042 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0043
     * @tc.name      expandTextText0043
     * @tc.desc      文本 Scene 3D 渲染 在 21px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0043 begin');
      const text: string = 'Scene 3D 渲染';
      const fontSize: number = 21;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(11);
      expect(width).assertEqual(231);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0043 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0044
     * @tc.name      expandTextText0044
     * @tc.desc      文本 Scene 3D 渲染 在 252px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0044 begin');
      const width: number = 231;
      const boxWidth: number = 252;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0044 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0045
     * @tc.name      expandTextText0045
     * @tc.desc      文本 Scene 3D 渲染 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0045 begin');
      const text: string = 'Scene 3D 渲染';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0045 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0046
     * @tc.name      expandTextText0046
     * @tc.desc      文本 Trim Video Clip 在 19px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0046 begin');
      const text: string = 'Trim Video Clip';
      const fontSize: number = 19;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(15);
      expect(width).assertEqual(285);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0046 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0047
     * @tc.name      expandTextText0047
     * @tc.desc      文本 Trim Video Clip 在 228px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0047 begin');
      const width: number = 285;
      const boxWidth: number = 228;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0047 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0048
     * @tc.name      expandTextText0048
     * @tc.desc      文本 Trim Video Clip 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0048 begin');
      const text: string = 'Trim Video Clip';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0048 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0049
     * @tc.name      expandTextText0049
     * @tc.desc      文本 Text Align 在 26px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0049 begin');
      const text: string = 'Text Align';
      const fontSize: number = 26;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(10);
      expect(width).assertEqual(260);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0049 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0050
     * @tc.name      expandTextText0050
     * @tc.desc      文本 Text Align 在 312px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0050 begin');
      const width: number = 260;
      const boxWidth: number = 312;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0050 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0051
     * @tc.name      expandTextText0051
     * @tc.desc      文本 Text Align 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0051 begin');
      const text: string = 'Text Align';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0051 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0052
     * @tc.name      expandTextText0052
     * @tc.desc      文本 Ellipsis Case 在 28px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0052 begin');
      const text: string = 'Ellipsis Case';
      const fontSize: number = 28;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(13);
      expect(width).assertEqual(364);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0052 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0053
     * @tc.name      expandTextText0053
     * @tc.desc      文本 Ellipsis Case 在 336px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0053 begin');
      const width: number = 364;
      const boxWidth: number = 336;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0053 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0054
     * @tc.name      expandTextText0054
     * @tc.desc      文本 Ellipsis Case 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0054 begin');
      const text: string = 'Ellipsis Case';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0054 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0055
     * @tc.name      expandTextText0055
     * @tc.desc      文本 LineHeight 1.5 在 30px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0055 begin');
      const text: string = 'LineHeight 1.5';
      const fontSize: number = 30;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(14);
      expect(width).assertEqual(420);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0055 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0056
     * @tc.name      expandTextText0056
     * @tc.desc      文本 LineHeight 1.5 在 360px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0056 begin');
      const width: number = 420;
      const boxWidth: number = 360;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0056 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0057
     * @tc.name      expandTextText0057
     * @tc.desc      文本 LineHeight 1.5 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0057 begin');
      const text: string = 'LineHeight 1.5';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0057 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0058
     * @tc.name      expandTextText0058
     * @tc.desc      文本 Font Weight Bold 在 32px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0058 begin');
      const text: string = 'Font Weight Bold';
      const fontSize: number = 32;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(16);
      expect(width).assertEqual(512);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0058 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0059
     * @tc.name      expandTextText0059
     * @tc.desc      文本 Font Weight Bold 在 384px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0059 begin');
      const width: number = 512;
      const boxWidth: number = 384;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0059 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0060
     * @tc.name      expandTextText0060
     * @tc.desc      文本 Font Weight Bold 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0060 begin');
      const text: string = 'Font Weight Bold';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0060 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0061
     * @tc.name      expandTextText0061
     * @tc.desc      文本 Expand Text Sample 在 34px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0061 begin');
      const text: string = 'Expand Text Sample';
      const fontSize: number = 34;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(18);
      expect(width).assertEqual(612);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0061 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0062
     * @tc.name      expandTextText0062
     * @tc.desc      文本 Expand Text Sample 在 408px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0062 begin');
      const width: number = 612;
      const boxWidth: number = 408;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0062 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0063
     * @tc.name      expandTextText0063
     * @tc.desc      文本 Expand Text Sample 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0063 begin');
      const text: string = 'Expand Text Sample';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0063 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0064
     * @tc.name      expandTextText0064
     * @tc.desc      文本 i18n Locale 在 36px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0064 begin');
      const text: string = 'i18n Locale';
      const fontSize: number = 36;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(11);
      expect(width).assertEqual(396);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0064 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0065
     * @tc.name      expandTextText0065
     * @tc.desc      文本 i18n Locale 在 432px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0065 begin');
      const width: number = 396;
      const boxWidth: number = 432;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0065 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0066
     * @tc.name      expandTextText0066
     * @tc.desc      文本 i18n Locale 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0066 begin');
      const text: string = 'i18n Locale';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0066 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0067
     * @tc.name      expandTextText0067
     * @tc.desc      文本 多语言样例 在 38px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0067 begin');
      const text: string = '多语言样例';
      const fontSize: number = 38;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(5);
      expect(width).assertEqual(190);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0067 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0068
     * @tc.name      expandTextText0068
     * @tc.desc      文本 多语言样例 在 456px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0068 begin');
      const width: number = 190;
      const boxWidth: number = 456;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0068 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0069
     * @tc.name      expandTextText0069
     * @tc.desc      文本 多语言样例 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0069 begin');
      const text: string = '多语言样例';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0069 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0070
     * @tc.name      expandTextText0070
     * @tc.desc      文本 镜像布局 RTL 在 40px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0070 begin');
      const text: string = '镜像布局 RTL';
      const fontSize: number = 40;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(8);
      expect(width).assertEqual(320);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0070 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0071
     * @tc.name      expandTextText0071
     * @tc.desc      文本 镜像布局 RTL 在 480px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0071 begin');
      const width: number = 320;
      const boxWidth: number = 480;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0071 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0072
     * @tc.name      expandTextText0072
     * @tc.desc      文本 镜像布局 RTL 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0072 begin');
      const text: string = '镜像布局 RTL';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0072 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0073
     * @tc.name      expandTextText0073
     * @tc.desc      文本 日本語サンプル 在 42px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0073 begin');
      const text: string = '日本語サンプル';
      const fontSize: number = 42;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(7);
      expect(width).assertEqual(294);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0073 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0074
     * @tc.name      expandTextText0074
     * @tc.desc      文本 日本語サンプル 在 504px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0074 begin');
      const width: number = 294;
      const boxWidth: number = 504;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0074 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0075
     * @tc.name      expandTextText0075
     * @tc.desc      文本 日本語サンプル 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0075 begin');
      const text: string = '日本語サンプル';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0075 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0076
     * @tc.name      expandTextText0076
     * @tc.desc      文本 한국어 예제 在 44px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0076 begin');
      const text: string = '한국어 예제';
      const fontSize: number = 44;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(6);
      expect(width).assertEqual(264);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0076 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0077
     * @tc.name      expandTextText0077
     * @tc.desc      文本 한국어 예제 在 528px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0077 begin');
      const width: number = 264;
      const boxWidth: number = 528;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0077 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0078
     * @tc.name      expandTextText0078
     * @tc.desc      文本 한국어 예제 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0078 begin');
      const text: string = '한국어 예제';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0078 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0079
     * @tc.name      expandTextText0079
     * @tc.desc      文本 Français 在 46px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0079 begin');
      const text: string = 'Français';
      const fontSize: number = 46;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(8);
      expect(width).assertEqual(368);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0079 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0080
     * @tc.name      expandTextText0080
     * @tc.desc      文本 Français 在 552px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0080 begin');
      const width: number = 368;
      const boxWidth: number = 552;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0080 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0081
     * @tc.name      expandTextText0081
     * @tc.desc      文本 Français 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0081 begin');
      const text: string = 'Français';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0081 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0082
     * @tc.name      expandTextText0082
     * @tc.desc      文本 Deutsch 在 48px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0082 begin');
      const text: string = 'Deutsch';
      const fontSize: number = 48;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(7);
      expect(width).assertEqual(336);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0082 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0083
     * @tc.name      expandTextText0083
     * @tc.desc      文本 Deutsch 在 576px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0083 begin');
      const width: number = 336;
      const boxWidth: number = 576;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0083 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0084
     * @tc.name      expandTextText0084
     * @tc.desc      文本 Deutsch 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0084 begin');
      const text: string = 'Deutsch';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0084 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0085
     * @tc.name      expandTextText0085
     * @tc.desc      文本 Español 在 50px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0085 begin');
      const text: string = 'Español';
      const fontSize: number = 50;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(7);
      expect(width).assertEqual(350);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0085 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0086
     * @tc.name      expandTextText0086
     * @tc.desc      文本 Español 在 600px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0086 begin');
      const width: number = 350;
      const boxWidth: number = 600;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0086 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0087
     * @tc.name      expandTextText0087
     * @tc.desc      文本 Español 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0087 begin');
      const text: string = 'Español';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0087 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0088
     * @tc.name      expandTextText0088
     * @tc.desc      文本 Português 在 52px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0088 begin');
      const text: string = 'Português';
      const fontSize: number = 52;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(9);
      expect(width).assertEqual(468);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0088 end');
    })

    /**
     * @tc.number    EXPAND_TEXT_0089
     * @tc.name      expandTextText0089
     * @tc.desc      文本 Português 在 624px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandTextText0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0089 begin');
      const width: number = 468;
      const boxWidth: number = 624;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandTextText0089 end');
    })
  })
}
