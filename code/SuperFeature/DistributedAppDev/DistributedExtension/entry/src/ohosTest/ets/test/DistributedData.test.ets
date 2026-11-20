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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { tick } from '../util/TestTick';
import { bindResourceManager, text } from '../../../main/ets/common/StringResource';
import {
  APP_COLLABORATION_SYSCAP,
  CHANNEL_API_PAYLOAD_LIMIT,
  CHANNEL_PAYLOAD_LIMIT,
  EXTENSION_TYPE_DISTRIBUTED,
  FEATURE_COUNT,
  LINK_PAYLOAD_LIMIT,
  RouteKey,
  isRouteKey
} from '../../../main/ets/common/AppConstants';
import {
  FEATURE_METAS,
  FeatureKind,
  entryFunctionOf,
  filterFeatures,
  isFeatureKind,
  metaOf
} from '../../../main/ets/model/DistributedCatalog';
import {
  COLLABORATE_ACCEPT,
  COLLABORATE_REJECT,
  ProbeStatus,
  channelStateName,
  classifyErrorCode,
  collaborateResultName,
  isChannelUsable,
  isReadyStatus,
  isSuccessCode,
  probeStatusHint,
  probeStatusName
} from '../../../main/ets/model/ProbeState';
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';
import {
  COLLABORATE_INDEX_KEY,
  buildRequest,
  collaborateIndex,
  mockRequest,
  shouldAccept,
  summarizeRequest,
  toggleAccepted,
  wantParamKeys
} from '../../../main/ets/model/CollabModel';
import { contextSnapshot, contextUnknownText, safeText } from '../../../main/ets/model/ExtensionContextInfo';
import {
  LinkAction,
  LinkStage,
  allowedActions,
  canClose,
  canConnect,
  canSend,
  canStart,
  canStop,
  nextStage,
  stageHint,
  stageName,
  summarizeStage
} from '../../../main/ets/model/LinkSession';
import {
  ChannelAction,
  ChannelStage,
  canSendData,
  channelStageHint,
  channelStageName,
  describeChannel,
  isMacAddress,
  isServiceUuid,
  nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../../../main/ets/model/LogStore';
import {
  describeThrown,
  distributedErrorHint,
  formatError,
  isKnownDistributedCode,
  codeOfThrown,
  messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';
import { formatDateTime, formatDuration, formatTime, pad2, truncateMiddle } from '../../../main/ets/utils/FormatUtil';

/** 只带 code / message 的对象：复现 BusinessError 被 catch 到时的最小形状 */
class CodedError {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }
}

/** 只有 message 的对象：复现"错误码藏在文案里"的情况 */
class MessageOnlyError {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

export default function distributedDataTest() {
  // 文案资源化后 model 层返回的是资源名：这里绑定 ResourceManager，套件才能按当前语言断言文案
  bindResourceManager(abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager);
  describe('DistributedCatalogDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0100
     * @tc.name catalogMetaCount
     * @tc.desc Verify the catalog exposes exactly three features in the documented order.
     */
    it('catalogMetaCount', 0, () => {
      // 资源解析契约：绑定了 ResourceManager 就必须拿到真文案，而不是回落的资源名
      expect(text('app_title')).assertEqual('分布式扩展与链路示例');
      expect(text('app_title') === 'app_title').assertFalse();
      expect(FEATURE_METAS.length).assertEqual(FEATURE_COUNT);
      expect(FEATURE_COUNT).assertEqual(3);
      expect(FEATURE_METAS[0].kind).assertEqual(FeatureKind.EXTENSION);
      expect(FEATURE_METAS[1].kind).assertEqual(FeatureKind.LINK);
      expect(FEATURE_METAS[2].kind).assertEqual(FeatureKind.CHANNEL);
      expect(metaOf(FeatureKind.LINK).kind).assertEqual(FeatureKind.LINK);
      expect(entryFunctionOf(FeatureKind.CHANNEL)).assertEqual('proxyChannelManager.openProxyChannel()');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0200
     * @tc.name catalogMetaFields
     * @tc.desc Verify each feature keeps the permission and doc page declared by the API reference.
     */
    it('catalogMetaFields', 0, () => {
      const link = metaOf(FeatureKind.LINK);
      expect(link.permission).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(link.docPage).assertEqual('js-apis-link-enhance.md');
      const channel = metaOf(FeatureKind.CHANNEL);
      expect(channel.permission).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
      expect(channel.docPage).assertEqual('js-apis-proxyChannelManager.md');
      expect(metaOf(FeatureKind.EXTENSION).apiName.includes('DistributedExtensionAbility')).assertTrue();
      expect(link.summary.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0300
     * @tc.name catalogFilterByKeyword
     * @tc.desc Verify the home page filter is case insensitive and matches api name as well as title.
     */
    it('catalogFilterByKeyword', 0, () => {
      expect(filterFeatures('').length).assertEqual(3);
      expect(filterFeatures('   ').length).assertEqual(3);
      expect(filterFeatures('channel').length).assertEqual(1);
      expect(filterFeatures('LINK').length).assertEqual(1);
      expect(filterFeatures('linkEnhance').length).assertEqual(1);
      expect(filterFeatures('proxyChannelManager').length).assertEqual(1);
      expect(filterFeatures('不存在的关键字').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0400
     * @tc.name catalogKindGuard
     * @tc.desc Verify the enum guards reject values that differ in case or are empty.
     */
    it('catalogKindGuard', 0, () => {
      expect(isFeatureKind('extension')).assertTrue();
      expect(isFeatureKind('link')).assertTrue();
      expect(isFeatureKind('channel')).assertTrue();
      expect(isFeatureKind('Extension')).assertFalse();
      expect(isFeatureKind('')).assertFalse();
      expect(isRouteKey(RouteKey.EXTENSION)).assertTrue();
      expect(isRouteKey(RouteKey.LINK)).assertTrue();
      expect(isRouteKey(RouteKey.CHANNEL)).assertTrue();
      expect(isRouteKey('other')).assertFalse();
    });
  });

  describe('DistributedProbeStateDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0500
     * @tc.name probeClassifyCommonCodes
     * @tc.desc Verify 201 / 401 / 801 / 0 map to the status names shown by the pages.
     */
    it('probeClassifyCommonCodes', 0, () => {
      expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(classifyErrorCode(401)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(classifyErrorCode(801)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(isSuccessCode(0)).assertTrue();
      expect(isSuccessCode(801)).assertFalse();
      expect(isReadyStatus(ProbeStatus.READY)).assertTrue();
      expect(isReadyStatus(ProbeStatus.FAILED)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0600
     * @tc.name probeClassifyLinkCodes
     * @tc.desc Verify every linkEnhance error code in the d.ts table maps to its own status.
     */
    it('probeClassifyLinkCodes', 0, () => {
      expect(classifyErrorCode(32390200)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390201)).assertEqual(ProbeStatus.NOT_READY);
      expect(classifyErrorCode(32390202)).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(classifyErrorCode(32390203)).assertEqual(ProbeStatus.DUPLICATE_NAME);
      expect(classifyErrorCode(32390204)).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(classifyErrorCode(32390205)).assertEqual(ProbeStatus.NOT_READY);
      expect(classifyErrorCode(32390206)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(classifyErrorCode(32390300)).assertEqual(ProbeStatus.INTERNAL);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0700
     * @tc.name probeClassifyChannelCodes
     * @tc.desc Verify every proxyChannelManager error code in the d.ts table maps to its own status.
     */
    it('probeClassifyChannelCodes', 0, () => {
      expect(classifyErrorCode(32390001)).assertEqual(ProbeStatus.BR_DISABLED);
      expect(classifyErrorCode(32390002)).assertEqual(ProbeStatus.UNPAIRED);
      expect(classifyErrorCode(32390004)).assertEqual(ProbeStatus.CHANNEL_INVALID);
      expect(classifyErrorCode(32390006)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(classifyErrorCode(32390100)).assertEqual(ProbeStatus.INTERNAL);
      expect(classifyErrorCode(32390101)).assertEqual(ProbeStatus.RESTRICTED);
      expect(classifyErrorCode(32390102)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(32390103)).assertEqual(ProbeStatus.DATA_TOO_LONG);
      expect(classifyErrorCode(32390104)).assertEqual(ProbeStatus.SEND_FAILED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0800
     * @tc.name probeStatusTexts
     * @tc.desc Verify status names, hints and the unprobed fallback stay in sync with the enum.
     */
    it('probeStatusTexts', 0, () => {
      expect(probeStatusName(ProbeStatus.READY)).assertEqual('可用');
      expect(probeStatusName(ProbeStatus.IDLE)).assertEqual('未探测');
      expect(probeStatusName(ProbeStatus.UNPAIRED)).assertEqual('对端未配对');
      expect(probeStatusHint(ProbeStatus.UNPAIRED).includes('配对')).assertTrue();
      expect(probeStatusHint(ProbeStatus.PERMISSION_DENIED).includes('DATASYNC')).assertTrue();
      expect(probeStatusHint(ProbeStatus.READY).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_0900
     * @tc.name channelStateTexts
     * @tc.desc Verify only CHANNEL_RESUME is treated as usable，其余三个取值都有独立文案。
     */
    it('channelStateTexts', 0, () => {
      expect(channelStateName(0)).assertEqual('通道不可用，等待恢复');
      expect(channelStateName(1)).assertEqual('通道已恢复');
      expect(channelStateName(2)).assertEqual('软件异常，通道不可用');
      expect(channelStateName(3)).assertEqual('蓝牙配对被删除，通道不可用');
      expect(channelStateName(9)).assertEqual('未知通道状态');
      expect(isChannelUsable(1)).assertTrue();
      expect(isChannelUsable(0)).assertFalse();
      expect(isChannelUsable(2)).assertFalse();
      expect(isChannelUsable(3)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1000
     * @tc.name collaborateResultText
     * @tc.desc Verify ACCEPT / REJECT stay aligned with AbilityConstant.CollaborateResult.
     */
    it('collaborateResultText', 0, () => {
      expect(COLLABORATE_ACCEPT).assertEqual(0);
      expect(COLLABORATE_REJECT).assertEqual(1);
      expect(collaborateResultName(COLLABORATE_ACCEPT).includes('ACCEPT')).assertTrue();
      expect(collaborateResultName(COLLABORATE_REJECT).includes('REJECT')).assertTrue();
      expect(collaborateResultName(7).includes('未知')).assertTrue();
    });
  });

  describe('DistributedTextCodecDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1100
     * @tc.name utf8EncodeLengths
     * @tc.desc Verify UTF-8 byte counting differs from String.length for Chinese and emoji.
     */
    it('utf8EncodeLengths', 0, () => {
      expect(utf8Length('')).assertEqual(0);
      expect(utf8Length('abc')).assertEqual(3);
      expect(utf8Length('中')).assertEqual(3);
      expect(utf8Length('中a')).assertEqual(4);
      expect(utf8Length('😀')).assertEqual(4);
      expect(encodeUtf8('A').byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1200
     * @tc.name utf8RoundTrip
     * @tc.desc Verify encode then decode returns the original text including surrogate pairs.
     */
    it('utf8RoundTrip', 0, () => {
      // 「中」= E4 B8 AD 后面再跟一个残缺首字节 E6：合法前缀照常解出，残缺字节单独丢弃
      const partial = new ArrayBuffer(4);
      const partialView = new Uint8Array(partial);
      partialView[0] = 0xE4;
      partialView[1] = 0xB8;
      partialView[2] = 0xAD;
      partialView[3] = 0xE6;
      expect(decodeUtf8(partial)).assertEqual('中');
      const samples: string[] = ['', 'hello', '分布式链路', 'a中b😀c'];
      for (let i = 0; i < samples.length; i++) {
        expect(decodeUtf8(encodeUtf8(samples[i]))).assertEqual(samples[i]);
      }
      const truncated = new ArrayBuffer(2);
      const truncatedView = new Uint8Array(truncated);
      truncatedView[0] = 0xE4;
      truncatedView[1] = 0xB8;
      expect(decodeUtf8(truncated)).assertEqual('');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1300
     * @tc.name utf8HexPreview
     * @tc.desc Verify the hex preview pads single byte values and marks the truncated tail.
     */
    it('utf8HexPreview', 0, () => {
      expect(toHexPreview(encodeUtf8('AB'))).assertEqual('41 42');
      expect(toHexPreview(encodeUtf8('AB'), 1)).assertEqual('41 …');
      expect(toHexPreview(encodeUtf8(''))).assertEqual('');
      expect(toHexPreview(encodeUtf8('\n'))).assertEqual('0A');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1400
     * @tc.name clampPayloadByBytes
     * @tc.desc Verify clamping drops whole characters instead of cutting a multi byte sequence.
     */
    it('clampPayloadByBytes', 0, () => {
      expect(clampPayload('中文', 3)).assertEqual('中');
      expect(clampPayload('中文', 2)).assertEqual('');
      expect(clampPayload('abc', 0)).assertEqual('');
      expect(clampPayload('abc', -1)).assertEqual('');
      expect(clampPayload('abc', 10)).assertEqual('abc');
      expect(utf8Length(clampPayload('a中', 4))).assertEqual(4);
    });
  });

  describe('DistributedCollabDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1500
     * @tc.name collabRequestParsing
     * @tc.desc Verify onCollaborate reads only the documented key and rejects an empty index.
     */
    it('collabRequestParsing', 0, () => {
      const withIndex: Record<string, Object> = {};
      withIndex[COLLABORATE_INDEX_KEY] = '2';
      expect(collaborateIndex(withIndex)).assertEqual('2');
      expect(wantParamKeys(withIndex).length).assertEqual(1);
      const empty: Record<string, Object> = {};
      expect(collaborateIndex(empty)).assertEqual('');
      expect(wantParamKeys(empty).length).assertEqual(0);
      expect(shouldAccept('1')).assertTrue();
      expect(shouldAccept('  ')).assertFalse();
      expect(shouldAccept('')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1600
     * @tc.name collabRequestSummary
     * @tc.desc Verify the simulated request reports the same verdict as the extension code path.
     */
    it('collabRequestSummary', 0, () => {
      const accepted = buildRequest(mockRequestParam('3'));
      expect(accepted.accepted).assertTrue();
      expect(accepted.keyCount).assertEqual(1);
      expect(summarizeRequest(accepted).includes('接受协同')).assertTrue();
      const rejected = mockRequest('');
      expect(rejected.accepted).assertFalse();
      expect(rejected.keyCount).assertEqual(0);
      expect(summarizeRequest(rejected).includes('拒绝协同')).assertTrue();
      expect(toggleAccepted(true)).assertFalse();
      expect(toggleAccepted(false)).assertTrue();
    });
  });

  describe('DistributedContextDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_3100
     * @tc.name contextSnapshotFields
     * @tc.desc Verify the extension context snapshot keeps the ExtensionContext fields and names type 28.
     */
    it('contextSnapshotFields', 0, () => {
      const snapshot = contextSnapshot('DistributedExtAbility', EXTENSION_TYPE_DISTRIBUTED, 'entry', 'zh-Hans');
      expect(snapshot.abilityName).assertEqual('DistributedExtAbility');
      expect(snapshot.moduleName).assertEqual('entry');
      expect(snapshot.language).assertEqual('zh-Hans');
      expect(snapshot.typeName().includes('distributed')).assertTrue();
      const text: string = snapshot.describe();
      expect(text.includes('context 可用')).assertTrue();
      expect(text.includes('DistributedExtAbility')).assertTrue();
      expect(text.includes('entry')).assertTrue();
      expect(text.includes('zh-Hans')).assertTrue();
      // Configuration.language 是可选字段，读不到时不能出现字符串 "undefined"
      expect(safeText(undefined)).assertEqual('');
      expect(safeText('zh-Hans')).assertEqual('zh-Hans');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_3200
     * @tc.name contextSnapshotFallback
     * @tc.desc Verify missing fields fall back to the placeholder and a non-distributed type is reported as such.
     */
    it('contextSnapshotFallback', 0, () => {
      const empty = contextSnapshot('', -1, '', safeText(undefined));
      expect(empty.abilityName).assertEqual(contextUnknownText());
      expect(empty.moduleName).assertEqual(contextUnknownText());
      expect(empty.language).assertEqual(contextUnknownText());
      expect(empty.typeName().includes('非 distributed')).assertTrue();
      expect(empty.typeName().includes('（distributed）')).assertFalse();
      expect(empty.describe().includes(contextUnknownText())).assertTrue();
    });
  });

  describe('DistributedLinkStageDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1700
     * @tc.name linkStageTransitions
     * @tc.desc Verify the Server and Connection transitions only advance from documented stages.
     */
    it('linkStageTransitions', 0, () => {
      expect(nextStage(LinkStage.EMPTY, LinkAction.CREATE_SERVER)).assertEqual(LinkStage.SERVER_CREATED);
      expect(nextStage(LinkStage.SERVER_CREATED, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(LinkStage.SERVER_STARTED, LinkAction.STOP)).assertEqual(LinkStage.SERVER_STOPPED);
      expect(nextStage(LinkStage.SERVER_STOPPED, LinkAction.START)).assertEqual(LinkStage.SERVER_STARTED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CONNECT)).assertEqual(LinkStage.EMPTY);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CREATE_CONNECTION)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.CONNECTION_CREATED, LinkAction.CONNECT)).assertEqual(LinkStage.CONNECTING);
      expect(nextStage(LinkStage.CONNECTING, LinkAction.PEER_CONNECTED)).assertEqual(LinkStage.CONNECTED);
      expect(nextStage(LinkStage.CONNECTED, LinkAction.DISCONNECT)).assertEqual(LinkStage.CONNECTION_CREATED);
      expect(nextStage(LinkStage.SERVER_STARTED, LinkAction.CLOSE)).assertEqual(LinkStage.CLOSED);
      expect(nextStage(LinkStage.EMPTY, LinkAction.CLOSE)).assertEqual(LinkStage.EMPTY);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1800
     * @tc.name linkActionAvailability
     * @tc.desc Verify each stage only enables the buttons that the API sequence allows next.
     */
    it('linkActionAvailability', 0, () => {
      expect(canStart(LinkStage.SERVER_CREATED)).assertTrue();
      expect(canStart(LinkStage.SERVER_STARTED)).assertFalse();
      expect(canStop(LinkStage.SERVER_STARTED)).assertTrue();
      expect(canStop(LinkStage.SERVER_CREATED)).assertFalse();
      expect(canConnect(LinkStage.CONNECTION_CREATED)).assertTrue();
      expect(canConnect(LinkStage.CONNECTING)).assertFalse();
      expect(canSend(LinkStage.CONNECTED)).assertTrue();
      expect(canSend(LinkStage.CONNECTING)).assertFalse();
      expect(canClose(LinkStage.EMPTY)).assertFalse();
      expect(canClose(LinkStage.SERVER_CREATED)).assertTrue();
      const created = allowedActions(LinkStage.SERVER_CREATED);
      expect(created.includes('start')).assertTrue();
      expect(created.includes('close')).assertTrue();
      expect(created.includes('stop')).assertFalse();
      expect(created.includes('sendData')).assertFalse();
      expect(allowedActions(LinkStage.CONNECTED).includes('sendData')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_1900
     * @tc.name linkStageTexts
     * @tc.desc Verify the stage names and hints explain the next call，含空服务名提示。
     */
    it('linkStageTexts', 0, () => {
      expect(stageName(LinkStage.EMPTY)).assertEqual('未创建');
      expect(stageName(LinkStage.CONNECTING)).assertEqual('正在连接');
      expect(stageName(LinkStage.SERVER_STOPPED)).assertEqual('服务端已停止');
      expect(stageHint(LinkStage.CONNECTING).includes('32390205')).assertTrue();
      expect(summarizeStage(LinkStage.SERVER_CREATED, 'sample')).assertEqual('服务端已创建；服务名 sample');
      expect(summarizeStage(LinkStage.SERVER_CREATED, '  ').includes('未填写服务名')).assertTrue();
    });
  });

  describe('DistributedChannelStageDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2000
     * @tc.name channelStageTransitions
     * @tc.desc Verify the channel stage machine follows open then send then close.
     */
    it('channelStageTransitions', 0, () => {
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(ChannelStage.FAILED, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.OPEN)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(ChannelStage.OPENING, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.OPEN);
      expect(nextChannelStage(ChannelStage.OPENING, ChannelAction.OPEN_FAIL)).assertEqual(ChannelStage.FAILED);
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN_OK)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.OPEN, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.CLOSE)).assertEqual(ChannelStage.CLOSED);
      expect(canSendData(ChannelStage.OPEN)).assertTrue();
      expect(canSendData(ChannelStage.OPENING)).assertFalse();
      expect(channelStageName(ChannelStage.FAILED)).assertEqual('打开失败');
      expect(channelStageHint(ChannelStage.FAILED).includes('32390002')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2100
     * @tc.name channelDescribeTexts
     * @tc.desc Verify the channel summary shows the id only after openProxyChannel resolves.
     */
    it('channelDescribeTexts', 0, () => {
      expect(describeChannel(-1, ChannelStage.CLOSED).includes('尚无 channelId')).assertTrue();
      expect(describeChannel(3, ChannelStage.OPEN)).assertEqual('通道已打开；channelId=3');
      expect(channelStageName(ChannelStage.CLOSED)).assertEqual('未打开');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2200
     * @tc.name channelParamValidation
     * @tc.desc Verify the local MAC and UUID checks mirror the peerDevAddr / peerUuid format.
     */
    it('channelParamValidation', 0, () => {
      expect(isMacAddress('12:34:56:78:9A:BC')).assertTrue();
      expect(isMacAddress('0a:1b:2c:3d:4e:5f')).assertTrue();
      expect(isMacAddress('12:34:56:78:9A')).assertFalse();
      expect(isMacAddress('12-34-56-78-9A-BC')).assertFalse();
      expect(isMacAddress('GG:34:56:78:9A:BC')).assertFalse();
      expect(isServiceUuid('0000A002-0000-1000-8000-00805F9B34FB')).assertTrue();
      expect(isServiceUuid('0000A002-0000-1000-8000-00805F9B34F')).assertFalse();
      expect(isServiceUuid('0000A00200001000800000805F9B34FB')).assertFalse();
      expect(isServiceUuid('0000A00Z-0000-1000-8000-00805F9B34FB')).assertFalse();
    });
  });

  describe('DistributedErrorDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2300
     * @tc.name errorHintCoverage
     * @tc.desc Verify every documented code returns a non empty hint and unknown codes fall back.
     */
    it('errorHintCoverage', 0, () => {
      expect(isKnownDistributedCode(201)).assertTrue();
      expect(isKnownDistributedCode(801)).assertTrue();
      expect(isKnownDistributedCode(32390001)).assertTrue();
      expect(isKnownDistributedCode(32390205)).assertTrue();
      expect(isKnownDistributedCode(32390300)).assertTrue();
      expect(isKnownDistributedCode(0)).assertFalse();
      expect(isKnownDistributedCode(999)).assertFalse();
      expect(distributedErrorHint(32390002).includes('配对')).assertTrue();
      expect(distributedErrorHint(32390201).includes('createServer')).assertTrue();
      expect(distributedErrorHint(32390103).includes('长度')).assertTrue();
      expect(distributedErrorHint(0)).assertEqual('操作已正常完成');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2400
     * @tc.name thrownCodeExtraction
     * @tc.desc Verify a code carried only inside the message text is still recovered.
     */
    it('thrownCodeExtraction', 0, () => {
      expect(codeOfThrown(new CodedError(201, 'denied'))).assertEqual(201);
      expect(codeOfThrown(new MessageOnlyError('BusinessError 32390205: not ready'))).assertEqual(32390205);
      expect(codeOfThrown(new MessageOnlyError('no digits here'))).assertEqual(0);
      expect(codeOfThrown(new MessageOnlyError('code 12'))).assertEqual(0);
      expect(messageOfThrown(new CodedError(801, 'not supported'))).assertEqual('not supported');
      expect(messageOfThrown(new MessageOnlyError('boom'))).assertEqual('boom');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2500
     * @tc.name errorTextFormat
     * @tc.desc Verify the failure text keeps the code，the message and the handling hint.
     */
    it('errorTextFormat', 0, () => {
      expect(formatError('connect', 32390205, 'not ready')).assertEqual('connect失败（32390205）：not ready');
      expect(formatError('connect', 0, '')).assertEqual('connect失败：未知错误');
      expect(describeThrown('sendData', 32390103, 'too long').includes('32390103')).assertTrue();
      expect(describeThrown('sendData', 32390103, 'too long').includes('长度')).assertTrue();
    });
  });

  describe('DistributedFormatDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2600
     * @tc.name formatTimeParts
     * @tc.desc Verify pad2 and the time helpers keep two digit fields.
     */
    it('formatTimeParts', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(12)).assertEqual('12');
      const date = new Date(2026, 0, 5, 7, 8, 9);
      expect(formatTime(date)).assertEqual('07:08:09');
      expect(formatDateTime(date)).assertEqual('2026-01-05 07:08:09');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2700
     * @tc.name formatDurationParts
     * @tc.desc Verify the duration text switches unit at one second and one minute.
     */
    it('formatDurationParts', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(truncateMiddle('abcdefgh', 5).includes('…')).assertTrue();
      expect(truncateMiddle('abcdefgh', 5).length).assertEqual(5);
      expect(truncateMiddle('abc', 5)).assertEqual('abc');
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
    });
  });

  describe('DistributedLogDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2800
     * @tc.name logAppendCapacity
     * @tc.desc Verify new entries are prepended and the capacity limit drops the oldest ones.
     */
    it('logAppendCapacity', 0, () => {
      const first = new LogItem('A', 'tag1', 'first detail', LogLevel.INFO);
      const second = new LogItem('B', 'tag2', 'second detail', LogLevel.ERROR);
      const third = new LogItem('A', 'tag3', 'third detail', LogLevel.WARN);
      const two = appendLog([first], second);
      expect(two.length).assertEqual(2);
      expect(two[0].source).assertEqual('B');
      const limited = appendLog(two, third, 2);
      expect(limited.length).assertEqual(2);
      expect(limited[0].tag).assertEqual('tag3');
      expect(limited[1].tag).assertEqual('tag2');
      expect(appendLog(two, third, 0).length).assertEqual(3);
      expect(clearLogs().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_2900
     * @tc.name logQueryFilters
     * @tc.desc Verify source，level，keyword and limit filters are applied together.
     */
    it('logQueryFilters', 0, () => {
      const first = new LogItem('A', 'createServer', '服务端已创建', LogLevel.INFO);
      const second = new LogItem('B', 'sendData', '发送 12 字节', LogLevel.ERROR);
      const third = new LogItem('A', 'connect', 'connect failed', LogLevel.WARN);
      const logs: LogItem[] = [first, second, third];
      expect(queryLogs(logs, 'A').length).assertEqual(2);
      expect(queryLogs(logs, 'B').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.WARN).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.ERROR).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'connect').length).assertEqual(1);
      expect(queryLogs(logs, 'A', LogLevel.DEBUG, '发送').length).assertEqual(0);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length).assertEqual(1);
      expect(countByTag(logs, 'A')).assertEqual(0);
      expect(countByTag(logs, 'connect')).assertEqual(1);
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
    });
  });

  describe('DistributedConstantDataTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DATA_3000
     * @tc.name distributedConstants
     * @tc.desc Verify the payload limits and the distributed extension type match the d.ts declarations.
     */
    it('distributedConstants', 0, () => {
      expect(LINK_PAYLOAD_LIMIT).assertEqual(1024);
      expect(CHANNEL_API_PAYLOAD_LIMIT).assertEqual(4096);
      expect(CHANNEL_PAYLOAD_LIMIT < CHANNEL_API_PAYLOAD_LIMIT).assertTrue();
      expect(EXTENSION_TYPE_DISTRIBUTED).assertEqual(28);
      expect(APP_COLLABORATION_SYSCAP).assertEqual('SystemCapability.DistributedSched.AppCollaboration');
    });
  });
}

/** 组装一个只带协同下标的 wantParam，保持与扩展里的读取路径一致 */
function mockRequestParam(index: string): Record<string, Object> {
  const param: Record<string, Object> = {};
  param[COLLABORATE_INDEX_KEY] = index;
  return param;
}
