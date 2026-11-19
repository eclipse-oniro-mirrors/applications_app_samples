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
import { openPage, backToIndex } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function NavigationMatrixPart1Test(): void {
  describe('NavigationMatrixPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0100
     * @tc.name      testNavigation0001
     * @tc.desc      Verify navigation to LocalSocket and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0001 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0200
     * @tc.name      testNavigation0002
     * @tc.desc      Verify navigation to Multicast and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0002 begin');
      expect(await openPage('多播通信', '启动多播通信')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0300
     * @tc.name      testNavigation0003
     * @tc.desc      Verify navigation to OneWayTls and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0003 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0400
     * @tc.name      testNavigation0004
     * @tc.desc      Verify navigation to Tcp2OneWayTls and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0004 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0500
     * @tc.name      testNavigation0005
     * @tc.desc      Verify navigation to Tcp2TwoWayTls and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0005 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0600
     * @tc.name      testNavigation0006
     * @tc.desc      Verify navigation to TcpClient and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0006 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0700
     * @tc.name      testNavigation0007
     * @tc.desc      Verify navigation to TcpServer and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0007 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0800
     * @tc.name      testNavigation0008
     * @tc.desc      Verify navigation to TlsServer and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0008 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_0900
     * @tc.name      testNavigation0009
     * @tc.desc      Verify navigation to TwoWayTls and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0009 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_NAVP1_1000
     * @tc.name      testNavigation0010
     * @tc.desc      Verify navigation to UdpClient_Server and back to Index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNavigation0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0010 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNavigation0010 end');
    })

  })
}
