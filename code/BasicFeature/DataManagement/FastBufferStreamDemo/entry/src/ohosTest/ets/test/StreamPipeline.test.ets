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
 
import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import fastbuffer from '@ohos.fastbuffer';
import { LogUtil } from '../../../main/ets/model/utils/LogUtil';
import { StreamPipeline } from '../../../main/ets/model/StreamPipeline';

/**
 * stream 流式演示设备侧测试（RK3568 / API 26 镜像）
 * 覆盖：Writable 落盘与水位线背压、cork/uncork、Readable 分块读取总量校验、
 * 三流流水线端到端（文件大小/大写加工/doFlush 尾块）、pipe 两跳流水线（场景8）、
 * Duplex 双工往返与 EOF（场景9）、沙箱文件清理
 */
const WAIT_STEP_MS = 100;
const WAIT_TIMEOUT_MS = 15000;
const CHUNK_SIZE = 4096;
const WRITE_CHUNKS = 100;
const PIPELINE_TOTAL = 20 * 1024 + '[PIPELINE-FLUSH-TAIL]'.length;

/** 执行流式演示并等待完成信号（onDone），超时返回 false */
async function runAndWait(sp: StreamPipeline, run: () => void): Promise<boolean> {
  let done = false;
  sp.onDone = () => {
    done = true;
  };
  run();
  const start: number = Date.now();
  while (!done && Date.now() - start < WAIT_TIMEOUT_MS) {
    await new Promise<void>((resolve) => {
      setTimeout(resolve, WAIT_STEP_MS);
    });
  }
  return done;
}

export default function streamPipelineTest() {
  describe('streamPipelineTest', () => {
    const filesDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
    const writeFile: string = `${filesDir}/stream_write_demo.txt`;
    const pipelineFile: string = `${filesDir}/stream_pipeline_demo.txt`;
    const pipeFile: string = `${filesDir}/stream_pipe_demo.txt`;

    beforeAll(() => {
    });

    afterAll(() => {
      // 清理沙箱演示文件
      const files: string[] = [writeFile, `${filesDir}/stream_read_source.txt`, pipelineFile, pipeFile];
      for (const f of files) {
        try {
          fs.unlinkSync(f);
        } catch (err) {
          // 不存在则忽略
        }
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0100
     * @tc.name writableFinishFileSize001
     * @tc.desc Verify the Writable streaming demo finishes and persists one hundred 4KB chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writable_finish_fileSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sp = new StreamPipeline();
      const done = await runAndWait(sp, () => {
        sp.runWritableDemo(filesDir);
      });
      expect(done).assertTrue();
      const size: number = fs.statSync(writeFile).size;
      expect(size).assertEqual(WRITE_CHUNKS * CHUNK_SIZE);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0200
     * @tc.name writableBackpressureLogged002
     * @tc.desc Verify cork/uncork and backpressure signals are logged when writes cross the high watermark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writable_backpressure_logged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sp = new StreamPipeline();
      const logs: string[] = [];
      LogUtil.init((line: string) => {
        logs.push(line);
      });
      const done = await runAndWait(sp, () => {
        sp.runWritableDemo(filesDir);
      });
      expect(done).assertTrue();
      // cork 10 块 × 4KB 远超默认 16KB 水位线，write() 必然返回 false（已实测 ROM 与 Node 语义一致）
      let backpressure = false;
      let corkLogged = false;
      let uncorkLogged = false;
      for (const msg of logs) {
        if (msg.includes('write() 返回 false')) {
          backpressure = true;
        }
        if (msg.includes('cork()')) {
          corkLogged = true;
        }
        if (msg.includes('uncork()')) {
          uncorkLogged = true;
        }
      }
      expect(backpressure).assertTrue();
      expect(corkLogged).assertTrue();
      expect(uncorkLogged).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0300
     * @tc.name readableEndTotalMatch003
     * @tc.desc Verify the Readable demo consumes all chunks and the end log confirms totals match the file size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readable_end_totalMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sp = new StreamPipeline();
      const logs: string[] = [];
      LogUtil.init((line: string) => {
        logs.push(line);
      });
      const done = await runAndWait(sp, () => {
        // 场景3 未跑时 runReadableDemo 会自动生成 200KB 源文件
        sp.runReadableDemo(filesDir);
      });
      expect(done).assertTrue();
      // end 事件日志应包含总量与文件大小一致的结论
      let endLogged = false;
      let totalMatched = false;
      for (const msg of logs) {
        if (msg.includes('end 事件')) {
          endLogged = true;
          if (msg.includes('一致')) {
            totalMatched = true;
          }
        }
      }
      expect(endLogged).assertTrue();
      expect(totalMatched).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0400
     * @tc.name pipelineFinishFileSize004
     * @tc.desc Verify the three-stage pipeline persists twenty kilobytes plus the flush tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pipeline_finish_fileSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sp = new StreamPipeline();
      const done = await runAndWait(sp, () => {
        sp.runPipelineDemo(filesDir);
      });
      expect(done).assertTrue();
      // 20 块 × 1024B + doFlush 尾块 21B
      const size: number = fs.statSync(pipelineFile).size;
      expect(size).assertEqual(PIPELINE_TOTAL);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0500
     * @tc.name pipelineContentUppercase005
     * @tc.desc Verify the pipeline file head is upper-cased by the Transform stage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pipeline_content_uppercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 用 FastBuffer 读回文件头 64B，校验 Transform 大写加工生效
      const fd: number = fs.openSync(pipelineFile, fs.OpenMode.READ_ONLY).fd;
      const head: ArrayBuffer = new ArrayBuffer(64);
      fs.readSync(fd, head, { offset: 0, length: 64 });
      fs.closeSync(fd);
      const headStr: string = fastbuffer.from(head).toString('utf8');
      expect(headStr.length).assertEqual(64);
      expect(headStr === headStr.toUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0600
     * @tc.name pipelineFlushTail006
     * @tc.desc Verify the doFlush tail marker is appended to the pipeline output file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pipeline_flush_tail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 读文件尾部 32B，校验 doFlush 追加的尾块标记
      const size: number = fs.statSync(pipelineFile).size;
      const fd: number = fs.openSync(pipelineFile, fs.OpenMode.READ_ONLY).fd;
      const tail: ArrayBuffer = new ArrayBuffer(32);
      fs.readSync(fd, tail, { offset: size - 32, length: 32 });
      fs.closeSync(fd);
      const tailStr: string = fastbuffer.from(tail).toString('utf8');
      expect(tailStr.includes('[PIPELINE-FLUSH-TAIL]')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0700
     * @tc.name pipelineReadableReuse007
     * @tc.desc Verify the Writable output file exists and can be consumed by a subsequent Readable run
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pipeline_readable_reuse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // 复用场景3 的文件做读取源（场景4 优先复用的路径），验证文件存在且可读
      const sp = new StreamPipeline();
      const done = await runAndWait(sp, () => {
        sp.runWritableDemo(filesDir);
      });
      expect(done).assertTrue();
      expect(fs.accessSync(writeFile)).assertTrue();
      const sp2 = new StreamPipeline();
      const done2 = await runAndWait(sp2, () => {
        sp2.runReadableDemo(filesDir);
      });
      expect(done2).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0800
     * @tc.name pipeFinishFileSize008
     * @tc.desc Verify the two-hop pipe demo finishes and persists ten 256-byte blocks plus the flush tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pipe_finish_fileSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // 场景8：pipe 两跳接线 → finish 落盘 10 块 × 256B + doFlush 尾块 21B = 2581B
      const sp = new StreamPipeline();
      const done = await runAndWait(sp, () => {
        sp.runPipeDemo(filesDir);
      });
      expect(done).assertTrue();
      const size: number = fs.statSync(pipeFile).size;
      expect(size).assertEqual(10 * 256 + '[PIPELINE-FLUSH-TAIL]'.length);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_0900
     * @tc.name pipeContentUppercase009
     * @tc.desc Verify the pipe output keeps block prefixes and upper-cases the filled characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pipe_content_uppercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 读回文件头 32B：块前缀 [BLOCK-001] 原样保留，填充字符 d 经 Transform 全部大写
      const fd: number = fs.openSync(pipeFile, fs.OpenMode.READ_ONLY).fd;
      const head: ArrayBuffer = new ArrayBuffer(32);
      fs.readSync(fd, head, { offset: 0, length: 32 });
      fs.closeSync(fd);
      const headStr: string = fastbuffer.from(head).toString('utf8');
      expect(headStr.includes('[BLOCK-001]')).assertTrue();
      expect(headStr === headStr.toUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_1000
     * @tc.name duplexRoundtripLogs010
     * @tc.desc Verify the Duplex demo echoes written data back and the round-trip log reports a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('duplex_roundtrip_logs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // 场景9：Duplex 写侧 hello/stream 转大写入队 → 读侧回送 HELLO STREAM
      const sp = new StreamPipeline();
      const logs: string[] = [];
      LogUtil.init((line: string) => {
        logs.push(line);
      });
      const done = await runAndWait(sp, () => {
        sp.runDuplexDemo();
      });
      expect(done).assertTrue();
      let roundtrip = false;
      let hasHello = false;
      let hasStream = false;
      for (const msg of logs) {
        if (msg.includes('往返校验') && msg.includes('一致')) {
          roundtrip = true;
        }
        if (msg.includes('HELLO')) {
          hasHello = true;
        }
        if (msg.includes('STREAM')) {
          hasStream = true;
        }
      }
      expect(roundtrip).assertTrue();
      expect(hasHello).assertTrue();
      expect(hasStream).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_STREAMPIPELINE_1100
     * @tc.name duplexEofLogged011
     * @tc.desc Verify the Duplex read side receives EOF and the end event is logged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('duplex_eof_logged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // 写侧 end → 队列排空 → 读侧收到 EOF 触发 end 事件
      const sp = new StreamPipeline();
      const logs: string[] = [];
      LogUtil.init((line: string) => {
        logs.push(line);
      });
      const done = await runAndWait(sp, () => {
        sp.runDuplexDemo();
      });
      expect(done).assertTrue();
      let endLogged = false;
      let eofMentioned = false;
      for (const msg of logs) {
        if (msg.includes('end 事件')) {
          endLogged = true;
        }
        if (msg.includes('EOF')) {
          eofMentioned = true;
        }
      }
      expect(endLogged).assertTrue();
      expect(eofMentioned).assertTrue();
    });
  });
}
