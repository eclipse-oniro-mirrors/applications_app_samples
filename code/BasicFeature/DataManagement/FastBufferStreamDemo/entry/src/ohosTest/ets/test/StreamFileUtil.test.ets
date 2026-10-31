import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { StreamFileUtil, ReadProgress } from '../../../main/ets/model/utils/StreamFileUtil';

/**
 * StreamFileUtil 流式文件工具类设备侧测试
 * 覆盖：流式写入落盘大小、流式读取总量与进度回调、内容还原、
 * 流式拷贝一致性与内容校验、getFileSize 异常路径
 */
export default function streamFileUtilTest() {
  describe('streamFileUtilTest', () => {
    const filesDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
    const writeFile: string = `${filesDir}/util_write_test.txt`;
    const copySrc: string = `${filesDir}/util_copy_src.txt`;
    const copyDest: string = `${filesDir}/util_copy_dest.txt`;

    beforeAll(() => {
    });

    afterAll(() => {
      const files: string[] = [writeFile, copySrc, copyDest];
      for (const f of files) {
        try {
          fs.unlinkSync(f);
        } catch (err) {
          // 忽略
        }
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEUTIL_0100
     * @tc.name writeFileStreamingSize001
     * @tc.desc Verify streaming write persists all chunks and returns the total byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writeFileStreaming_size', 0, async () => {
      const chunk = 'x'.repeat(1024);
      const written = await StreamFileUtil.writeFileStreaming(writeFile, [chunk, chunk, chunk]);
      expect(written).assertEqual(3072);
      expect(StreamFileUtil.getFileSize(writeFile)).assertEqual(3072);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEUTIL_0200
     * @tc.name readFileStreamingTotalAndProgress002
     * @tc.desc Verify streaming read returns the total bytes and reports per-chunk progress
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readFileStreaming_totalAndProgress', 0, async () => {
      const infos: ReadProgress[] = [];
      const received = await StreamFileUtil.readFileStreaming(writeFile, (info: ReadProgress, _chunk: string) => {
        infos.push(info);
      });
      expect(received).assertEqual(3072);
      // 3KB < 4KB 分块 → 1 块读完
      expect(infos.length).assertEqual(1);
      expect(infos[0].chunkIndex).assertEqual(1);
      expect(infos[0].totalBytes).assertEqual(3072);
      expect(infos[0].fileSize).assertEqual(3072);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEUTIL_0300
     * @tc.name readFileStreamingContentRestored003
     * @tc.desc Verify multi-chunk content read back matches the written content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readFileStreaming_contentRestored', 0, async () => {
      // 多块内容还原：写 5 块 × 1KB（含块号前缀），读回拼接比对
      const chunks: string[] = [];
      for (let i = 0; i < 5; i++) {
        chunks.push(`[P${i}]` + 'y'.repeat(1024 - 4));
      }
      await StreamFileUtil.writeFileStreaming(writeFile, chunks);
      let restored = '';
      await StreamFileUtil.readFileStreaming(writeFile, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      let expected = '';
      for (const c of chunks) {
        expected += c;
      }
      expect(restored).assertEqual(expected);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEUTIL_0400
     * @tc.name copyFileStreamingSize004
     * @tc.desc Verify streaming copy returns the copied byte count and the destination size matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copyFileStreaming_size', 0, async () => {
      const chunk = 'z'.repeat(1024);
      await StreamFileUtil.writeFileStreaming(copySrc, [chunk, chunk]);
      const copied = await StreamFileUtil.copyFileStreaming(copySrc, copyDest);
      expect(copied).assertEqual(2048);
      expect(StreamFileUtil.getFileSize(copyDest)).assertEqual(2048);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEUTIL_0500
     * @tc.name copyFileStreamingContentIdentical005
     * @tc.desc Verify the copied file content is identical to the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copyFileStreaming_contentIdentical', 0, async () => {
      // 拷贝后内容逐块一致
      let srcData = '';
      let destData = '';
      await StreamFileUtil.readFileStreaming(copySrc, (_info: ReadProgress, chunk: string) => {
        srcData += chunk;
      });
      await StreamFileUtil.readFileStreaming(copyDest, (_info: ReadProgress, chunk: string) => {
        destData += chunk;
      });
      expect(destData).assertEqual(srcData);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEUTIL_0600
     * @tc.name getFileSizeMissing006
     * @tc.desc Verify getFileSize returns -1 for a missing file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getFileSize_missing', 0, () => {
      expect(StreamFileUtil.getFileSize(`${filesDir}/no_such_file_${Date.now()}.txt`)).assertEqual(-1);
    });
  });
}
