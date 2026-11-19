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
import { openPage, backToIndex, waitForText } from './shared/SocketUiSupport';
import { Component } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function ButtonLabelTextPart1Test(): void {
  describe('ButtonLabelTextPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0100
     * @tc.name      testButtonLabel0001
     * @tc.desc      Verify LocalSocket button label is 启动LocalSocket服务器.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0001 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      const node: Component | null = await waitForText('启动LocalSocket服务器', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('启动LocalSocket服务器');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0200
     * @tc.name      testButtonLabel0002
     * @tc.desc      Verify LocalSocket button label is 开始Local_Socket通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0002 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      const node: Component | null = await waitForText('开始Local_Socket通信', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('开始Local_Socket通信');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0300
     * @tc.name      testButtonLabel0003
     * @tc.desc      Verify LocalSocket button label is 关闭Socket服务.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0003 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      const node: Component | null = await waitForText('关闭Socket服务', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('关闭Socket服务');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0400
     * @tc.name      testButtonLabel0004
     * @tc.desc      Verify Multicast button label is 启动多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0004 begin');
      expect(await openPage('多播通信', '启动多播通信')).assertTrue();
      const node: Component | null = await waitForText('启动多播通信', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('启动多播通信');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0500
     * @tc.name      testButtonLabel0005
     * @tc.desc      Verify OneWayTls button label is 选择.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0005 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('选择', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('选择');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0600
     * @tc.name      testButtonLabel0006
     * @tc.desc      Verify OneWayTls button label is 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0006 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('加载', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('加载');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0700
     * @tc.name      testButtonLabel0007
     * @tc.desc      Verify OneWayTls button label is 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0007 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0800
     * @tc.name      testButtonLabel0008
     * @tc.desc      Verify OneWayTls button label is 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0008 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('关闭连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('关闭连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_0900
     * @tc.name      testButtonLabel0009
     * @tc.desc      Verify OneWayTls button label is 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0009 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('发送', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('发送');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1000
     * @tc.name      testButtonLabel0010
     * @tc.desc      Verify Tcp2OneWayTls button label is 选择.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0010 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('选择', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('选择');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1100
     * @tc.name      testButtonLabel0011
     * @tc.desc      Verify Tcp2OneWayTls button label is 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0011 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('加载', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('加载');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1200
     * @tc.name      testButtonLabel0012
     * @tc.desc      Verify Tcp2OneWayTls button label is 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0012 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1300
     * @tc.name      testButtonLabel0013
     * @tc.desc      Verify Tcp2OneWayTls button label is 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0013 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('发送', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('发送');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1400
     * @tc.name      testButtonLabel0014
     * @tc.desc      Verify Tcp2TwoWayTls button label is 选择.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0014 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('选择', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('选择');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1500
     * @tc.name      testButtonLabel0015
     * @tc.desc      Verify Tcp2TwoWayTls button label is 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0015 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('加载', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('加载');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1600
     * @tc.name      testButtonLabel0016
     * @tc.desc      Verify Tcp2TwoWayTls button label is 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0016 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1700
     * @tc.name      testButtonLabel0017
     * @tc.desc      Verify Tcp2TwoWayTls button label is 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0017 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('发送', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('发送');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1800
     * @tc.name      testButtonLabel0018
     * @tc.desc      Verify Tcp2TwoWayTls button label is 关闭服务.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0018 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('关闭服务', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('关闭服务');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_1900
     * @tc.name      testButtonLabel0019
     * @tc.desc      Verify TcpClient button label is 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0019 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      const node: Component | null = await waitForText('连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2000
     * @tc.name      testButtonLabel0020
     * @tc.desc      Verify TcpClient button label is 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0020 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      const node: Component | null = await waitForText('关闭连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('关闭连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2100
     * @tc.name      testButtonLabel0021
     * @tc.desc      Verify TcpServer button label is 启动服务器.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0021 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      const node: Component | null = await waitForText('启动服务器', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('启动服务器');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2200
     * @tc.name      testButtonLabel0022
     * @tc.desc      Verify TcpServer button label is 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0022 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      const node: Component | null = await waitForText('发送', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('发送');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2300
     * @tc.name      testButtonLabel0023
     * @tc.desc      Verify TcpServer button label is 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0023 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      const node: Component | null = await waitForText('关闭连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('关闭连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2400
     * @tc.name      testButtonLabel0024
     * @tc.desc      Verify TlsServer button label is 选择.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0024 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('选择', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('选择');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0024 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2500
     * @tc.name      testButtonLabel0025
     * @tc.desc      Verify TlsServer button label is 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0025 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('加载', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('加载');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0025 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2600
     * @tc.name      testButtonLabel0026
     * @tc.desc      Verify TlsServer button label is 启动服务器.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0026 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('启动服务器', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('启动服务器');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0026 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2700
     * @tc.name      testButtonLabel0027
     * @tc.desc      Verify TlsServer button label is 停止服务.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0027 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('停止服务', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('停止服务');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0027 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2800
     * @tc.name      testButtonLabel0028
     * @tc.desc      Verify TwoWayTls button label is 选择.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0028 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('选择', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('选择');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0028 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_2900
     * @tc.name      testButtonLabel0029
     * @tc.desc      Verify TwoWayTls button label is 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0029 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('加载', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('加载');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0029 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_3000
     * @tc.name      testButtonLabel0030
     * @tc.desc      Verify TwoWayTls button label is 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0030 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0030 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_3100
     * @tc.name      testButtonLabel0031
     * @tc.desc      Verify TwoWayTls button label is 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0031 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      const node: Component | null = await waitForText('发送', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('发送');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0031 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_3200
     * @tc.name      testButtonLabel0032
     * @tc.desc      Verify UdpClient_Server button label is 启动服务器.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0032 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      const node: Component | null = await waitForText('启动服务器', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('启动服务器');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0032 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_3300
     * @tc.name      testButtonLabel0033
     * @tc.desc      Verify UdpClient_Server button label is 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0033 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      const node: Component | null = await waitForText('发送', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('发送');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0033 end');
    })

    /**
     * @tc.number    SUB_SOCKET_BTNLABELP1_3400
     * @tc.name      testButtonLabel0034
     * @tc.desc      Verify UdpClient_Server button label is 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testButtonLabel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0034 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      const node: Component | null = await waitForText('关闭连接', 2500);
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(await node.getText()).assertEqual('关闭连接');
      }
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonLabel0034 end');
    })

  })
}
