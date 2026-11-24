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
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { getTestContext } from '../JsUiSession';
import { paceTurn } from '../TestPace';

export default function resourceReferenceTest(): void {
  describe('resourceReferenceTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitResourceReference0001
     * @tc.name testJsunitResourceReference0001
     * @tc.desc Read the bundled resfile, verify exact bytes and close its fd on every exit path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitResourceReference0001', 0, async (): Promise<void> => {
      const context: common.UIAbilityContext = getTestContext();
      const resDir: string = context.resourceDir;
      const files: string[] = await fs.listFile(resDir);
      hilog.info(0x0000, 'ResourceExample', 'packaged resfile names=%{public}s', JSON.stringify(files));
      expect(files).assertContain('test.txt');
      const file: fs.File = fs.openSync(`${resDir}/test.txt`, fs.OpenMode.READ_ONLY);
      try {
        const data: ArrayBuffer = new ArrayBuffer(4096);
        const readLen: number = await fs.read(file.fd, data);
        hilog.info(0x0000, 'ResourceExample', 'packaged test.txt bytes=%{public}d', readLen);
        expect(readLen).assertEqual(23);
        const content: string = buffer.from(data, 0, readLen).toString();
        hilog.info(0x0000, 'ResourceExample', 'packaged test.txt content=%{public}s', content);
        expect(content).assertEqual('Resource Reference Test');
      } finally {
        fs.closeSync(file);
      }
    });
  });
}
