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

export default function CrossPageRevisitPart1Test(): void {
  describe('CrossPageRevisitPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0100
     * @tc.name      testCrossPageRevisit0001
     * @tc.desc      Verify LocalSocket, then Multicast, then LocalSocket can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0001 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('多播通信', '启动多播通信')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0200
     * @tc.name      testCrossPageRevisit0002
     * @tc.desc      Verify Multicast, then OneWayTls, then Multicast can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0002 begin');
      expect(await openPage('多播通信', '启动多播通信')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('多播通信', '启动多播通信')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0300
     * @tc.name      testCrossPageRevisit0003
     * @tc.desc      Verify OneWayTls, then Tcp2OneWayTls, then OneWayTls can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0003 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0400
     * @tc.name      testCrossPageRevisit0004
     * @tc.desc      Verify Tcp2OneWayTls, then Tcp2TwoWayTls, then Tcp2OneWayTls can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0004 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0500
     * @tc.name      testCrossPageRevisit0005
     * @tc.desc      Verify Tcp2TwoWayTls, then TcpClient, then Tcp2TwoWayTls can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0005 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0600
     * @tc.name      testCrossPageRevisit0006
     * @tc.desc      Verify TcpClient, then TcpServer, then TcpClient can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0006 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0700
     * @tc.name      testCrossPageRevisit0007
     * @tc.desc      Verify TcpServer, then TlsServer, then TcpServer can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0007 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0800
     * @tc.name      testCrossPageRevisit0008
     * @tc.desc      Verify TlsServer, then TwoWayTls, then TlsServer can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0008 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_0900
     * @tc.name      testCrossPageRevisit0009
     * @tc.desc      Verify TwoWayTls, then UdpClient_Server, then TwoWayTls can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0009 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_REVISITP1_1000
     * @tc.name      testCrossPageRevisit0010
     * @tc.desc      Verify UdpClient_Server, then LocalSocket, then UdpClient_Server can be opened sequentially.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCrossPageRevisit0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0010 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossPageRevisit0010 end');
    })

  })
}
