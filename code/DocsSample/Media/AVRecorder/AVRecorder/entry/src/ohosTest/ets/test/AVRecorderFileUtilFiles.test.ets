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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import recorderFileUtil from '../../../main/ets/utils/RecorderFileUtil';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const context: common.Context = delegator.getAppContext();

const TAG: string = '[Sample_avRecorderFileUtilFiles]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderFileUtilFilesTest(): void {
  describe('avRecorderFileUtilFilesTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0001
     * @tc.name      testExtRecFileList0000
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0002
     * @tc.name      testExtRecFileList0001
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0003
     * @tc.name      testExtRecFileList0002
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0004
     * @tc.name      testExtRecFileList0003
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0005
     * @tc.name      testExtRecFileList0004
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0006
     * @tc.name      testExtRecFileList0005
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0007
     * @tc.name      testExtRecFileList0006
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0008
     * @tc.name      testExtRecFileList0007
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0009
     * @tc.name      testExtRecFileList0008
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0010
     * @tc.name      testExtRecFileList0009
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0011
     * @tc.name      testExtRecFileList0010
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0012
     * @tc.name      testExtRecFileList0011
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0013
     * @tc.name      testExtRecFileList0012
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0014
     * @tc.name      testExtRecFileList0013
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0015
     * @tc.name      testExtRecFileList0014
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0016
     * @tc.name      testExtRecFileList0015
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0017
     * @tc.name      testExtRecFileList0016
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0018
     * @tc.name      testExtRecFileList0017
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0019
     * @tc.name      testExtRecFileList0018
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0020
     * @tc.name      testExtRecFileList0019
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0021
     * @tc.name      testExtRecFileList0020
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0022
     * @tc.name      testExtRecFileList0021
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0023
     * @tc.name      testExtRecFileList0022
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0024
     * @tc.name      testExtRecFileList0023
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0025
     * @tc.name      testExtRecFileList0024
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0026
     * @tc.name      testExtRecFileList0025
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0027
     * @tc.name      testExtRecFileList0026
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0028
     * @tc.name      testExtRecFileList0027
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0029
     * @tc.name      testExtRecFileList0028
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0030
     * @tc.name      testExtRecFileList0029
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0031
     * @tc.name      testExtRecFileList0030
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0032
     * @tc.name      testExtRecFileList0031
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0033
     * @tc.name      testExtRecFileList0032
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0034
     * @tc.name      testExtRecFileList0033
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0035
     * @tc.name      testExtRecFileList0034
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0036
     * @tc.name      testExtRecFileList0035
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0037
     * @tc.name      testExtRecFileList0036
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0038
     * @tc.name      testExtRecFileList0037
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0039
     * @tc.name      testExtRecFileList0038
     * @tc.desc      RecorderFileUtil createAudioFile creates listable AUDIO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('AUDIO_') && files[index].endsWith('.m4a')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILELIST_0040
     * @tc.name      testExtRecFileList0039
     * @tc.desc      RecorderFileUtil createVideoFile creates listable VIDEO_ file.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileList0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dir: string = context.filesDir;
      const oldFiles: string[] = await fileIo.listFile(dir);
      for (let index: number = 0; index < oldFiles.length; index++) {
        if (oldFiles[index].startsWith('AUDIO_') || oldFiles[index].startsWith('VIDEO_')) {
          try { fileIo.unlinkSync(dir + '/' + oldFiles[index]); } catch (err) {}
        }
      }
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      const files: string[] = await fileIo.listFile(dir);
      let created: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].startsWith('VIDEO_') && files[index].endsWith('.mp4')) {
          created = files[index];
        }
      }
      expect(created.length).assertLarger(0);
      const stat = fileIo.statSync(dir + '/' + created);
      expect(stat.size).assertLargerOrEqual(0);
      fileIo.unlinkSync(dir + '/' + created);
    })
  });
}
