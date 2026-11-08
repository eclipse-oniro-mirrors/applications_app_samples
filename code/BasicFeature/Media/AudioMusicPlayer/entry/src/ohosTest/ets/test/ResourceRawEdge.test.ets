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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { getRawStringData, parseLrcLyric } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';
import { ResourceConversion } from '../../../main/ets/common/utils/ResourceConversion';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const LRC_PATH: string = 'lrcfiles/DreamItPossible.lrc';
const LRC_DECODED_FIRST: string = '[00:00.15]Delacey - Dream It Possible';
const LRC_DECODED_LAST_TIME: number = 193900;
const LRC_LINE_COUNT: number = 41;

function countNonEmptyLines(text: string): number {
  let count: number = 0;
  for (let line of text.split('\n')) {
    if (line.trim().length > 0) {
      count++;
    }
  }
  return count;
}

export default function ResourceRawEdgeTest() {
  describe('ResourceRawEdgeTest', () => {
    beforeAll(() => {
      let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      if (!AppStorage.get('context')) {
        AppStorage.setOrCreate('context', context);
      }
    });

    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_RESOURCE_RAW_0100
     * @tc.name      testResourceRawEdge0001
     * @tc.desc      验证空文件名读取歌词直接返回未定义且不访问资源
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResourceRawEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_EmptyName_0001 begin');
      let context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      let fromEmpty: string | undefined = await MediaTools.getLrcFromRawFile(
        context as common.UIAbilityContext, '');
      let fromShortRaw: string = await getRawStringData(context, LRC_PATH);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `空文件名结果=${fromEmpty === undefined ? 'undefined' : fromEmpty.length}, 正常路径长度=${fromShortRaw.length}`);
      expect(fromEmpty === undefined).assertTrue();
      expect(fromEmpty !== '').assertTrue();
      expect(fromShortRaw.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_EmptyName_0001 end');
    });

    /**
     * @tc.number    SUB_RESOURCE_RAW_0200
     * @tc.name      testResourceRawEdge0002
     * @tc.desc      验证歌词原始文件的解码文本与解析出的行数时间范围一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResourceRawEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_DecodeParse_0002 begin');
      let context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      let decoded: string = await getRawStringData(context, LRC_PATH);
      let decodedLines: number = countNonEmptyLines(decoded);
      let entries: LrcEntry[] = parseLrcLyric(decoded);
      let firstLine: string = decoded.split('\n')[0];
      let increasing: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime <= entries[i - 1].lineStartTime) {
          increasing = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `解码行数=${decodedLines}, 解析行数=${entries.length}, 首行=[${firstLine}], 时间严格递增=${increasing}`);
      expect(firstLine).assertEqual(LRC_DECODED_FIRST);
      expect(firstLine.charCodeAt(0)).assertEqual(91);
      expect(decodedLines).assertEqual(entries.length);
      expect(entries.length).assertEqual(LRC_LINE_COUNT);
      expect(entries[entries.length - 1].lineStartTime).assertEqual(LRC_DECODED_LAST_TIME);
      expect(increasing).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_DecodeParse_0002 end');
    });

    /**
     * @tc.number    SUB_RESOURCE_RAW_0300
     * @tc.name      testResourceRawEdge0003
     * @tc.desc      验证原始文件长度与经文本解码后行数对应且逐字节读取结果一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResourceRawEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_ByteLength_0003 begin');
      let context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      let bytes: Uint8Array = await context.resourceManager.getRawFileContent(LRC_PATH);
      let decoded: string = await getRawStringData(context, LRC_PATH);
      let newlineBytes: number = 0;
      for (let value of bytes) {
        if (value === 10) {
          newlineBytes++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `字节数=${bytes.length}, 换行字节=${newlineBytes}, 解码字符数=${decoded.length}, 行数=${LRC_LINE_COUNT}`);
      expect(bytes.length >= decoded.length).assertTrue();
      expect(newlineBytes).assertEqual(LRC_LINE_COUNT - 1);
      expect(decoded.split('\n').length).assertEqual(LRC_LINE_COUNT);
      expect(bytes[0]).assertEqual(91);
      expect(decoded.charCodeAt(0)).assertEqual(91);
      hilog.info(DOMAIN, TAG, '%{public}s', bytes.length > 0 ? '非空原始文件' : '空原始文件');
      expect(bytes.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_ByteLength_0003 end');
    });

    /**
     * @tc.number    SUB_RESOURCE_RAW_0400
     * @tc.name      testResourceRawEdge0004
     * @tc.desc      验证不存在的歌词路径读取失败且错误码有效而正常路径不受影响
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResourceRawEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_MissingPath_0004 begin');
      let context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      let thrown: boolean = false;
      let errorCode: number = 0;
      try {
        await getRawStringData(context, 'lrcfiles/NotExistSong.lrc');
      } catch (error) {
        thrown = true;
        errorCode = (error as BusinessError).code;
      }
      let normal: string = await getRawStringData(context, LRC_PATH);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `缺失路径抛错=${thrown}, 错误码=${errorCode}, 正常路径长度=${normal.length}`);
      expect(thrown).assertTrue();
      expect(errorCode !== 0).assertTrue();
      expect(normal.length > 0).assertTrue();
      expect(parseLrcLyric(normal).length).assertEqual(LRC_LINE_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_MissingPath_0004 end');
    });

    /**
     * @tc.number    SUB_RESOURCE_RAW_0500
     * @tc.name      testResourceRawEdge0005
     * @tc.desc      验证重复读取歌词内容保持一致且每次解析结果等价
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResourceRawEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_RepeatRead_0005 begin');
      let context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      let first: string = await MediaTools.getLrcFromRawFile(
        context as common.UIAbilityContext, LRC_PATH) as string;
      let second: string = await MediaTools.getLrcFromRawFile(
        context as common.UIAbilityContext, LRC_PATH) as string;
      let firstEntries: LrcEntry[] = parseLrcLyric(first);
      let secondEntries: LrcEntry[] = parseLrcLyric(second);
      let sameTimes: boolean = firstEntries.length === secondEntries.length;
      for (let i = 0; i < firstEntries.length && sameTimes; i++) {
        if (firstEntries[i].lineStartTime !== secondEntries[i].lineStartTime) {
          sameTimes = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `两次长度=${first.length}/${second.length}, 两次行数=${firstEntries.length}/${secondEntries.length}`);
      expect(first).assertEqual(second);
      expect(first.length > 0).assertTrue();
      expect(firstEntries.length).assertEqual(LRC_LINE_COUNT);
      expect(sameTimes).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RawLyric_RepeatRead_0005 end');
    });
    //
    // /**
    //  * @tc.number    SUB_RESOURCE_RAW_0600
    //  * @tc.name      testResourceRawEdge0006
    //  * @tc.desc      验证资源字符串转换为空资源或空上下文时返回未定义而有效资源可正常解析
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     LEVEL0
    //  */
    // it('testResourceRawEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    //   hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Resource_EmptyInput_0006 begin');
    //   let storedContext: Object | undefined = AppStorage.get<Object>('context');
    //   let conversion: ResourceConversion = new ResourceConversion();
    //   let noId: string | undefined = conversion.getStringValueFromResource({ id: 0 } as Resource);
    //   let missingId: Object = {};
    //   let undefinedId: string | undefined =
    //     conversion.getStringValueFromResource(missingId as Resource);
    //   let missingResource: Object = undefined;
    //   let noResource: string | undefined = conversion.getStringValueFromResource(missingResource as Resource);
    //   let realTitle: string | undefined = conversion.getStringValueFromResource($r('app.string.song_title_one'));
    //   AppStorage.setOrCreate('context', undefined);
    //   let withoutContext: string | undefined = new ResourceConversion()
    //     .getStringValueFromResource($r('app.string.song_title_one'));
    //   AppStorage.setOrCreate('context', storedContext);
    //   let titleLength: number = realTitle === undefined ? -1 : realTitle.length;
    //   hilog.info(DOMAIN, TAG, '%{public}s',
    //     `无上下文=${withoutContext === undefined}, 空资源=${noId === undefined}, 真实标题长度=${titleLength}`);
    //   expect(noId === undefined).assertTrue();
    //   expect(undefinedId === undefined).assertTrue();
    //   expect(noResource === undefined).assertTrue();
    //   expect(titleLength > 0).assertTrue();
    //   hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Resource_EmptyInput_0006 end');
    // });
  });
}
