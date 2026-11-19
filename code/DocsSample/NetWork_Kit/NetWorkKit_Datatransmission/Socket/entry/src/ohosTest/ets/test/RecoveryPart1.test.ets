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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ensureIndex, tap, waitForText, driver, INDEX_LABEL } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function RecoveryPart1Test(): void {
  describe('RecoveryPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0100
     * @tc.name      testBackRecovery0001
     * @tc.desc      Verify system back from LocalSocket returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0001 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('LocalSocket 数据传输')).assertTrue();
      expect(await waitForText('启动LocalSocket服务器', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0200
     * @tc.name      testBackRecovery0002
     * @tc.desc      Verify system back from Multicast returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0002 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('多播通信')).assertTrue();
      expect(await waitForText('启动多播通信', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0300
     * @tc.name      testBackRecovery0003
     * @tc.desc      Verify system back from OneWayTls returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0003 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('单向TLS Socket 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0400
     * @tc.name      testBackRecovery0004
     * @tc.desc      Verify system back from Tcp2OneWayTls returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0004 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('TCP Socket 升级为单向TLS Socket 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0500
     * @tc.name      testBackRecovery0005
     * @tc.desc      Verify system back from Tcp2TwoWayTls returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0005 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('TCP Socket 升级为双向TLS Socket加密数据传输')).assertTrue();
      expect(await waitForText('选择', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0600
     * @tc.name      testBackRecovery0006
     * @tc.desc      Verify system back from TcpClient returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0006 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('Tcp客户端')).assertTrue();
      expect(await waitForText('连接', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0700
     * @tc.name      testBackRecovery0007
     * @tc.desc      Verify system back from TcpServer returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0007 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('Tcp服务端')).assertTrue();
      expect(await waitForText('启动服务器', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0800
     * @tc.name      testBackRecovery0008
     * @tc.desc      Verify system back from TlsServer returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0008 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('TLS Socket Server 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_0900
     * @tc.name      testBackRecovery0009
     * @tc.desc      Verify system back from TwoWayTls returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0009 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('双向TLS Socket 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RECOVERYP1_1000
     * @tc.name      testBackRecovery0010
     * @tc.desc      Verify system back from UdpClient_Server returns to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackRecovery0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0010 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('Udp客户端&服务端')).assertTrue();
      expect(await waitForText('启动服务器', 2500) !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(500);
      expect(await waitForText(INDEX_LABEL, 2500) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBackRecovery0010 end');
    })

  })
}
