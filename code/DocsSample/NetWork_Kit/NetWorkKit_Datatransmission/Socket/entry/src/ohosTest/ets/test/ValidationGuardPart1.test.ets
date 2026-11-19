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
import { openPage, tap, backToIndex, isControlEnabled, waitForTextContains } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function ValidationGuardPart1Test(): void {
  describe('ValidationGuardPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0100
     * @tc.name      testValidationGuard0001
     * @tc.desc      Verify TcpClient Connect without Server IP reports missing fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0001 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await tap('连接')).assertTrue();
      expect(await waitForTextContains('Some required fields are missing.', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0200
     * @tc.name      testValidationGuard0002
     * @tc.desc      Verify TcpServer Start without Server IP reports missing fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0002 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await tap('启动服务器')).assertTrue();
      expect(await waitForTextContains('Some required fields are missing.', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0300
     * @tc.name      testValidationGuard0003
     * @tc.desc      Verify TcpServer Send without message reports missing fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0003 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await tap('发送')).assertTrue();
      expect(await waitForTextContains('Some required fields are missing.', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0400
     * @tc.name      testValidationGuard0004
     * @tc.desc      Verify Udp Start without Server IP reports missing fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0004 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await tap('启动服务器')).assertTrue();
      expect(await waitForTextContains('Some required fields are missing.', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0500
     * @tc.name      testValidationGuard0005
     * @tc.desc      Verify Udp Send without client IP reports missing fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0005 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await tap('发送')).assertTrue();
      expect(await waitForTextContains('Some required fields are missing.', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0600
     * @tc.name      testValidationGuard0006
     * @tc.desc      Verify OneWayTls Connect stays disabled before CA is loaded.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0006 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await isControlEnabled('连接')).assertFalse();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_VALIDATEP1_0700
     * @tc.name      testValidationGuard0007
     * @tc.desc      Verify Tcp2OneWayTls Load stays disabled before a CA file is selected.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testValidationGuard0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0007 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await isControlEnabled('加载')).assertFalse();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testValidationGuard0007 end');
    })

  })
}
