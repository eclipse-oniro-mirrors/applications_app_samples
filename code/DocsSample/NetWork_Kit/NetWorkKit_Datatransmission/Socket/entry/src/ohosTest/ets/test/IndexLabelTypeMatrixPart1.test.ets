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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ensureIndex, waitForText } from './shared/SocketUiSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function IndexLabelTypeMatrixPart1Test(): void {
  describe('IndexLabelTypeMatrixPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0100
     * @tc.name      testLabelType0001
     * @tc.desc      Verify Index entry Tcp客户端 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0001 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('Tcp客户端');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0200
     * @tc.name      testLabelType0002
     * @tc.desc      Verify Index entry Tcp服务端 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0002 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('Tcp服务端');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0300
     * @tc.name      testLabelType0003
     * @tc.desc      Verify Index entry Udp客户端&服务端 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0003 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('Udp客户端&服务端');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0400
     * @tc.name      testLabelType0004
     * @tc.desc      Verify Index entry 多播通信 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0004 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('多播通信');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0500
     * @tc.name      testLabelType0005
     * @tc.desc      Verify Index entry LocalSocket 数据传输 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0005 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('LocalSocket 数据传输');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0600
     * @tc.name      testLabelType0006
     * @tc.desc      Verify Index entry 单向TLS Socket 加密数据传输 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0006 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('单向TLS Socket 加密数据传输');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0700
     * @tc.name      testLabelType0007
     * @tc.desc      Verify Index entry 双向TLS Socket 加密数据传输 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0007 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('双向TLS Socket 加密数据传输');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0800
     * @tc.name      testLabelType0008
     * @tc.desc      Verify Index entry TCP Socket 升级为单向TLS Socket 加密数据传输 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0008 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_0900
     * @tc.name      testLabelType0009
     * @tc.desc      Verify Index entry TCP Socket 升级为双向TLS Socket加密数据传输 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0009 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LTPP1_1000
     * @tc.name      testLabelType0010
     * @tc.desc      Verify Index entry TLS Socket Server 加密数据传输 is a Text component.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelType0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0010 begin');
      expect(await ensureIndex()).assertTrue();
      const node = await waitForText('TLS Socket Server 加密数据传输');
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getType()).assertEqual('Text');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelType0010 end');
    })

  })
}
