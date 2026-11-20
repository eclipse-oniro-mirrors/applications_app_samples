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
import { ensureIndex, waitForText, tap, backToIndex } from './shared/SocketUiSupport';
import { Component } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function IndexCatalogPart1Test(): void {
  describe('IndexCatalogPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0100
     * @tc.name      testIndexLabelText0001
     * @tc.desc      Verify Index entry text is Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0001 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('Tcp客户端', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('Tcp客户端');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0200
     * @tc.name      testIndexLabelText0002
     * @tc.desc      Verify Index entry text is Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0002 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('Tcp服务端', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('Tcp服务端');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0300
     * @tc.name      testIndexLabelText0003
     * @tc.desc      Verify Index entry text is Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0003 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('Udp客户端&服务端', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('Udp客户端&服务端');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0400
     * @tc.name      testIndexLabelText0004
     * @tc.desc      Verify Index entry text is 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0004 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('多播通信', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('多播通信');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0500
     * @tc.name      testIndexLabelText0005
     * @tc.desc      Verify Index entry text is LocalSocket 数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0005 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('LocalSocket 数据传输', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('LocalSocket 数据传输');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0600
     * @tc.name      testIndexLabelText0006
     * @tc.desc      Verify Index entry text is 单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0006 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('单向TLS Socket 加密数据传输', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('单向TLS Socket 加密数据传输');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0700
     * @tc.name      testIndexLabelText0007
     * @tc.desc      Verify Index entry text is 双向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0007 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('双向TLS Socket 加密数据传输', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('双向TLS Socket 加密数据传输');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0800
     * @tc.name      testIndexLabelText0008
     * @tc.desc      Verify Index entry text is TCP Socket 升级为单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0008 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('TCP Socket 升级为单向TLS Socket 加密数据传输', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('TCP Socket 升级为单向TLS Socket 加密数据传输');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_0900
     * @tc.name      testIndexLabelText0009
     * @tc.desc      Verify Index entry text is TCP Socket 升级为双向TLS Socket加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0009 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('TCP Socket 升级为双向TLS Socket加密数据传输', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('TCP Socket 升级为双向TLS Socket加密数据传输');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1000
     * @tc.name      testIndexLabelText0010
     * @tc.desc      Verify Index entry text is TLS Socket Server 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexLabelText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0010 begin');
      expect(await ensureIndex()).assertTrue();
      const node: Component | null = await waitForText('TLS Socket Server 加密数据传输', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('TLS Socket Server 加密数据传输');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexLabelText0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1100
     * @tc.name      testIndexNavigate0011
     * @tc.desc      Verify Index entry LocalSocket 数据传输 opens LocalSocket.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0011 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('LocalSocket 数据传输')).assertTrue();
      expect(await waitForText('启动LocalSocket服务器', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1200
     * @tc.name      testIndexNavigate0012
     * @tc.desc      Verify Index entry 多播通信 opens Multicast.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0012 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('多播通信')).assertTrue();
      expect(await waitForText('启动多播通信', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1300
     * @tc.name      testIndexNavigate0013
     * @tc.desc      Verify Index entry 单向TLS Socket 加密数据传输 opens OneWayTls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0013 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('单向TLS Socket 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1400
     * @tc.name      testIndexNavigate0014
     * @tc.desc      Verify Index entry TCP Socket 升级为单向TLS Socket 加密数据传输 opens Tcp2OneWayTls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0014 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('TCP Socket 升级为单向TLS Socket 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1500
     * @tc.name      testIndexNavigate0015
     * @tc.desc      Verify Index entry TCP Socket 升级为双向TLS Socket加密数据传输 opens Tcp2TwoWayTls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0015 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('TCP Socket 升级为双向TLS Socket加密数据传输')).assertTrue();
      expect(await waitForText('选择', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1600
     * @tc.name      testIndexNavigate0016
     * @tc.desc      Verify Index entry Tcp客户端 opens TcpClient.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0016 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('Tcp客户端')).assertTrue();
      expect(await waitForText('连接', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1700
     * @tc.name      testIndexNavigate0017
     * @tc.desc      Verify Index entry Tcp服务端 opens TcpServer.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0017 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('Tcp服务端')).assertTrue();
      expect(await waitForText('启动服务器', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1800
     * @tc.name      testIndexNavigate0018
     * @tc.desc      Verify Index entry TLS Socket Server 加密数据传输 opens TlsServer.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0018 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('TLS Socket Server 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_1900
     * @tc.name      testIndexNavigate0019
     * @tc.desc      Verify Index entry 双向TLS Socket 加密数据传输 opens TwoWayTls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0019 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('双向TLS Socket 加密数据传输')).assertTrue();
      expect(await waitForText('选择', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INDEXP1_2000
     * @tc.name      testIndexNavigate0020
     * @tc.desc      Verify Index entry Udp客户端&服务端 opens UdpClient_Server.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexNavigate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0020 begin');
      expect(await ensureIndex()).assertTrue();
      expect(await tap('Udp客户端&服务端')).assertTrue();
      expect(await waitForText('启动服务器', 3000) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexNavigate0020 end');
    })

  })
}
