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
import { openPage, backToIndex, inputIntoField } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function InputRetentionPart1Test(): void {
  describe('InputRetentionPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0100
     * @tc.name      testInputRetention0001
     * @tc.desc      Verify OneWayTls text input 1 keeps the typed value 401.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0001 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(0, '401')).assertEqual('401');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0200
     * @tc.name      testInputRetention0002
     * @tc.desc      Verify OneWayTls text input 2 keeps the typed value 402.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0002 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(1, '402')).assertEqual('402');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0300
     * @tc.name      testInputRetention0003
     * @tc.desc      Verify Tcp2OneWayTls text input 1 keeps the typed value 403.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0003 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(0, '403')).assertEqual('403');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0400
     * @tc.name      testInputRetention0004
     * @tc.desc      Verify Tcp2OneWayTls text input 2 keeps the typed value 404.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0004 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(1, '404')).assertEqual('404');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0500
     * @tc.name      testInputRetention0005
     * @tc.desc      Verify Tcp2TwoWayTls text input 1 keeps the typed value 405.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0005 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(0, '405')).assertEqual('405');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0600
     * @tc.name      testInputRetention0006
     * @tc.desc      Verify Tcp2TwoWayTls text input 2 keeps the typed value 406.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0006 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(1, '406')).assertEqual('406');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0700
     * @tc.name      testInputRetention0007
     * @tc.desc      Verify TcpClient text input 1 keeps the typed value 407.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0007 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await inputIntoField(0, '407')).assertEqual('407');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0800
     * @tc.name      testInputRetention0008
     * @tc.desc      Verify TcpClient text input 2 keeps the typed value 408.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0008 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await inputIntoField(1, '408')).assertEqual('408');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_0900
     * @tc.name      testInputRetention0009
     * @tc.desc      Verify TcpServer text input 1 keeps the typed value 409.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0009 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await inputIntoField(0, '409')).assertEqual('409');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1000
     * @tc.name      testInputRetention0010
     * @tc.desc      Verify TcpServer text input 2 keeps the typed value 410.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0010 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await inputIntoField(1, '410')).assertEqual('410');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1100
     * @tc.name      testInputRetention0011
     * @tc.desc      Verify TlsServer text input 1 keeps the typed value 411.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0011 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(0, '411')).assertEqual('411');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1200
     * @tc.name      testInputRetention0012
     * @tc.desc      Verify TlsServer text input 2 keeps the typed value 412.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0012 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(1, '412')).assertEqual('412');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1300
     * @tc.name      testInputRetention0013
     * @tc.desc      Verify TwoWayTls text input 1 keeps the typed value 413.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0013 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(0, '413')).assertEqual('413');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1400
     * @tc.name      testInputRetention0014
     * @tc.desc      Verify TwoWayTls text input 2 keeps the typed value 414.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0014 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await inputIntoField(1, '414')).assertEqual('414');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1500
     * @tc.name      testInputRetention0015
     * @tc.desc      Verify UdpClient_Server text input 1 keeps the typed value 415.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0015 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await inputIntoField(0, '415')).assertEqual('415');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_INPUTP1_1600
     * @tc.name      testInputRetention0016
     * @tc.desc      Verify UdpClient_Server text input 2 keeps the typed value 416.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInputRetention0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0016 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await inputIntoField(1, '416')).assertEqual('416');
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputRetention0016 end');
    })

  })
}
