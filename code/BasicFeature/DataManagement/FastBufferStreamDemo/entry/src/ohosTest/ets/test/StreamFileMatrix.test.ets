import { describe, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { StreamFileUtil, ReadProgress } from '../../../main/ets/model/utils/StreamFileUtil';

/**
 * 流式文件工具矩阵测试
 *
 * 在真实沙箱文件上覆盖「数据规模 × 分块边界」矩阵：
 * 单块/整块/跨块写入、1B/4096B/4097B/12KB 读取分块数、进度累计、
 * 1B/100B/8193B 流式拷贝、写入后文件大小、缺失文件读写拒绝。
 * 全部使用 ASCII 内容（FileReadable 按字节切分后转 utf8，边界不跨字符）。
 */

const CHUNK_SIZE = 4096;

function buildChunks(count: number, size: number, marker: string): string[] {
  const chunks: string[] = [];
  for (let i = 0; i < count; i++) {
    const prefix = `[C${i}]`;
    chunks.push(prefix + marker.repeat(Math.max(0, size - prefix.length)));
  }
  return chunks;
}

function concatChunks(chunks: string[]): string {
  let text = '';
  for (const c of chunks) {
    text += c;
  }
  return text;
}

export default function streamFileMatrixTest() {
  describe('streamFileMatrixTest', () => {
    const filesDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
    const singleFile: string = `${filesDir}/matrix_single.txt`;
    const exactFile: string = `${filesDir}/matrix_exact.txt`;
    const crossFile: string = `${filesDir}/matrix_cross.txt`;
    const progressFile: string = `${filesDir}/matrix_progress.txt`;
    const oneByteFile: string = `${filesDir}/matrix_one_byte.txt`;
    const overFile: string = `${filesDir}/matrix_over.txt`;
    const copySmallSrc: string = `${filesDir}/matrix_copy_small_src.txt`;
    const copySmallDest: string = `${filesDir}/matrix_copy_small_dest.txt`;
    const copyBigSrc: string = `${filesDir}/matrix_copy_big_src.txt`;
    const copyBigDest: string = `${filesDir}/matrix_copy_big_dest.txt`;

    afterAll(() => {
      const files: string[] = [singleFile, exactFile, crossFile, progressFile, oneByteFile, overFile,
        copySmallSrc, copySmallDest, copyBigSrc, copyBigDest];
      for (const f of files) {
        try {
          fs.unlinkSync(f);
        } catch (err) {
          // 不存在则忽略
        }
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0100
     * @tc.name write_single_chunk
     * @tc.desc Verify a three-byte single chunk write persists and reads back the same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('write_single_chunk', 0, async () => {
      const written = await StreamFileUtil.writeFileStreaming(singleFile, ['abc']);
      expect(written).assertEqual(3);
      expect(StreamFileUtil.getFileSize(singleFile)).assertEqual(3);
      let restored = '';
      await StreamFileUtil.readFileStreaming(singleFile, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      expect(restored).assertEqual('abc');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0200
     * @tc.name write_exact_chunk_boundary
     * @tc.desc Verify four 1KB chunks land on the 4096-byte boundary with intact content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('write_exact_chunk_boundary', 0, async () => {
      const chunks = buildChunks(4, 1024, 'e');
      const written = await StreamFileUtil.writeFileStreaming(exactFile, chunks);
      expect(written).assertEqual(CHUNK_SIZE);
      expect(StreamFileUtil.getFileSize(exactFile)).assertEqual(CHUNK_SIZE);
      let restored = '';
      await StreamFileUtil.readFileStreaming(exactFile, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      expect(restored).assertEqual(concatChunks(chunks));
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0300
     * @tc.name write_cross_chunk_boundary
     * @tc.desc Verify a single 5000-byte chunk crosses the 4KB boundary and persists fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('write_cross_chunk_boundary', 0, async () => {
      const text = 'x'.repeat(5000);
      const written = await StreamFileUtil.writeFileStreaming(crossFile, [text]);
      expect(written).assertEqual(5000);
      expect(StreamFileUtil.getFileSize(crossFile)).assertEqual(5000);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0400
     * @tc.name read_three_full_chunks_with_progress
     * @tc.desc Verify reading three full chunks reports sequential chunk indexes and cumulative totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('read_three_full_chunks_with_progress', 0, async () => {
      const chunks = buildChunks(3, CHUNK_SIZE, 'p');
      await StreamFileUtil.writeFileStreaming(progressFile, chunks);
      const infos: ReadProgress[] = [];
      const received = await StreamFileUtil.readFileStreaming(progressFile,
        (info: ReadProgress, _chunk: string) => {
          infos.push(info);
        });
      expect(received).assertEqual(3 * CHUNK_SIZE);
      expect(infos.length).assertEqual(3);
      for (let i = 0; i < infos.length; i++) {
        expect(infos[i].chunkIndex).assertEqual(i + 1);
        expect(infos[i].chunkBytes).assertEqual(CHUNK_SIZE);
        expect(infos[i].fileSize).assertEqual(3 * CHUNK_SIZE);
      }
      expect(infos[2].totalBytes).assertEqual(3 * CHUNK_SIZE);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0500
     * @tc.name read_one_byte_is_one_chunk
     * @tc.desc Verify a one-byte file is consumed as a single one-byte chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('read_one_byte_is_one_chunk', 0, async () => {
      await StreamFileUtil.writeFileStreaming(oneByteFile, ['z']);
      const infos: ReadProgress[] = [];
      const received = await StreamFileUtil.readFileStreaming(oneByteFile,
        (info: ReadProgress, _chunk: string) => {
          infos.push(info);
        });
      expect(received).assertEqual(1);
      expect(infos.length).assertEqual(1);
      expect(infos[0].chunkBytes).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0600
     * @tc.name read_4097_bytes_is_two_chunks
     * @tc.desc Verify one byte past the chunk boundary produces a full chunk plus a one-byte tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('read_4097_bytes_is_two_chunks', 0, async () => {
      await StreamFileUtil.writeFileStreaming(overFile, ['o'.repeat(CHUNK_SIZE + 1)]);
      const infos: ReadProgress[] = [];
      const received = await StreamFileUtil.readFileStreaming(overFile,
        (info: ReadProgress, _chunk: string) => {
          infos.push(info);
        });
      expect(received).assertEqual(CHUNK_SIZE + 1);
      expect(infos.length).assertEqual(2);
      expect(infos[0].chunkBytes).assertEqual(CHUNK_SIZE);
      expect(infos[1].chunkBytes).assertEqual(1);
      expect(infos[1].totalBytes).assertEqual(CHUNK_SIZE + 1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0700
     * @tc.name read_content_matches_multi_chunk_write
     * @tc.desc Verify five 1KB chunks written in one call read back in order with identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('read_content_matches_multi_chunk_write', 0, async () => {
      const chunks = buildChunks(5, 1000, 'q');
      await StreamFileUtil.writeFileStreaming(overFile, chunks);
      let restored = '';
      await StreamFileUtil.readFileStreaming(overFile, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      expect(restored).assertEqual(concatChunks(chunks));
      expect(restored.length).assertEqual(5000);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0800
     * @tc.name copy_one_byte
     * @tc.desc Verify streaming copy of a one-byte file returns one byte and preserves its content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_one_byte', 0, async () => {
      await StreamFileUtil.writeFileStreaming(copySmallSrc, ['m']);
      const copied = await StreamFileUtil.copyFileStreaming(copySmallSrc, copySmallDest);
      expect(copied).assertEqual(1);
      expect(StreamFileUtil.getFileSize(copySmallDest)).assertEqual(1);
      let restored = '';
      await StreamFileUtil.readFileStreaming(copySmallDest, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      expect(restored).assertEqual('m');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_0900
     * @tc.name copy_small_less_than_chunk
     * @tc.desc Verify copying a hundred-byte file preserves its content exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_small_less_than_chunk', 0, async () => {
      const text = 'k'.repeat(100);
      await StreamFileUtil.writeFileStreaming(copySmallSrc, [text]);
      const copied = await StreamFileUtil.copyFileStreaming(copySmallSrc, copySmallDest);
      expect(copied).assertEqual(100);
      let restored = '';
      await StreamFileUtil.readFileStreaming(copySmallDest, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      expect(restored).assertEqual(text);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_1000
     * @tc.name copy_across_chunk_boundary
     * @tc.desc Verify copying 8193 bytes spanning two chunk boundaries preserves size and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_across_chunk_boundary', 0, async () => {
      const text = 'b'.repeat(2 * CHUNK_SIZE + 1);
      await StreamFileUtil.writeFileStreaming(copyBigSrc, [text]);
      const copied = await StreamFileUtil.copyFileStreaming(copyBigSrc, copyBigDest);
      expect(copied).assertEqual(2 * CHUNK_SIZE + 1);
      expect(StreamFileUtil.getFileSize(copyBigDest)).assertEqual(2 * CHUNK_SIZE + 1);
      let restored = '';
      await StreamFileUtil.readFileStreaming(copyBigDest, (_info: ReadProgress, chunk: string) => {
        restored += chunk;
      });
      expect(restored).assertEqual(text);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_1100
     * @tc.name getFileSize_after_write_matches
     * @tc.desc Verify getFileSize reports the same byte count returned by the streaming write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getFileSize_after_write_matches', 0, async () => {
      const written = await StreamFileUtil.writeFileStreaming(singleFile, ['1234567890']);
      expect(written).assertEqual(10);
      expect(StreamFileUtil.getFileSize(singleFile)).assertEqual(written);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMFILEMATRIX_1200
     * @tc.name read_missing_file_rejects
     * @tc.desc Verify streaming read of a missing sandbox file rejects the returned promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('read_missing_file_rejects', 0, async () => {
      let rejected = false;
      try {
        await StreamFileUtil.readFileStreaming(`${filesDir}/matrix_missing_${Date.now()}.txt`,
          (_info: ReadProgress, _chunk: string) => {
          });
      } catch (err) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });
  });
}
