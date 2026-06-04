'use static';
/**
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

import { describe, expect, it }  from '../../../../hypium/index';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { sleep } from '../Util.test'
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

export default function resourceReferenceTest(): void {
  describe('resourceReferenceTest', (): void => {
    /**
     * @tc.number: testResourceReference_001
     * @tc.name: testResourceReference
     * @tc.desc: 在ohosTest测试用例中获取资源文件，资源文件存储在 resources/resfile 下，用例执行过程中保持屏幕开启，否则无法获取到topAbility
     */
    it('testResourceReference', 0, async () => {
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      // 获取当前top的ability
      let topAbility: UIAbility = await delegator.getCurrentTopAbility();
      expect(topAbility.context.abilityInfo.name).assertEqual('EntryAbility');
      // 获取资源文件路径，并读取文件
      let resDir: string = topAbility.context.resourceDir;
      expect(resDir != '').assertTrue();
      let resFileList: string[] = await fs.listFile(resDir);
      expect(resFileList).assertContain('test.txt');
      let filePath: string = resDir + '/test.txt';
      let file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(4096);
      let readLen = await fs.read(file.fd, arrayBuffer);
      expect(readLen != 0).assertTrue();
      let buf: buffer.Buffer = buffer.from(arrayBuffer, 0, readLen.toInt());
      expect(buf.toString()).assertEqual('Resource Reference Test');
    })
  })
}