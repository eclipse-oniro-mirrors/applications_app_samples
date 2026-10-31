/**
 * stream 流式数据处理演示
 *
 * 场景3：Writable 流式写入
 *   使用 StreamFileUtil 提供的 FileWritable 分块落盘到应用沙箱文件；
 *   演示 cork/uncork 强制缓冲、水位线背压（write() 返回 false）、finish 事件收尾
 *
 * 场景4：Readable 流式读取
 *   使用 StreamFileUtil 提供的 FileReadable 分块读取沙箱文件并 push；
 *   data 事件逐块消费，统计块数与字节数，全程不整载文件
 *
 * 场景5：三流完整流水线
 *   Readable（内存产数）→ Transform（大写加工 + doFlush 尾部处理）→ Writable（落盘），
 *   结束后用 FastBuffer 读回文件头校验加工结果，串联两个模块
 *
 * 场景8：pipe 一行流水线
 *   与场景5 相同的三流拓扑改用官方 pipe() 接线：
 *   source.pipe(transform) → transform.pipe(sink)，框架自动转发 data/end，
 *   对比手工事件级联，展示标准流水线写法
 *
 * 场景9：Duplex 双工流
 *   同一个流上写侧 write 转大写入队、读侧 data 事件回送，
 *   验证 Duplex 读写双向通路与写侧 end → 读侧 EOF 的时序
 *
 * API 依据：docs/zh-cn/application-dev/reference/apis-arkts/js-apis-stream.md
 * （stream 首批接口 API 12+；数据单元为 string | Uint8Array）
 */
import stream from '@ohos.util.stream';
import { emitter } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import fastbuffer from '@ohos.fastbuffer';
import { LogUtil } from './utils/LogUtil';
import { FileWritable, FileReadable } from './utils/StreamFileUtil';

const TAG = 'StreamPipeline';

/** 场景3 写入的块数：100 块 × 4KB = 400KB，足以触发默认 16KB 水位线 */
const WRITE_CHUNKS: number = 100;
/** 场景3 每块大小（4KB） */
const CHUNK_SIZE: number = 4096;
/** 场景5 流水线的数据块数 */
const PIPELINE_BLOCKS: number = 20;
/** 场景5 每块数据大小（约 1KB） */
const PIPELINE_BLOCK_SIZE: number = 1024;
/** 场景8 pipe 流水线的数据块数（小块低速率，避免 sink 缓冲积压） */
const PIPE_BLOCKS: number = 10;
/** 场景8 每块数据大小（256B） */
const PIPE_BLOCK_SIZE: number = 256;

/** 场景5/8：数据源流。模拟分块产出的数据（如网络下载/传感器采样），内存生成不落盘 */
class GeneratorReadable extends stream.Readable {
  private blocks: number;
  private blockSize: number;
  private sent: number = 0;
  private notify: (index: number) => void;

  constructor(blocks: number, notify: (index: number) => void, blockSize: number = PIPELINE_BLOCK_SIZE) {
    super();
    this.blocks = blocks;
    this.blockSize = blockSize;
    this.notify = notify;
  }

  doRead(size: number): void {
    if (this.sent >= this.blocks) {
      this.push(null);
      return;
    }
    this.sent++;
    this.notify(this.sent);
    const head: string = `[BLOCK-${String(this.sent).padStart(3, '0')}]`;
    this.push(head + 'd'.repeat(this.blockSize - head.length));
  }
}

/** 场景5：转换流。将数据块转大写；doFlush 在流结束时处理尾部数据 */
class UpperCaseTransform extends stream.Transform {
  private notify: (info: string) => void;

  constructor(notify: (info: string) => void) {
    super();
    this.notify = notify;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    const out: string = chunk.toUpperCase();
    this.notify(`块加工 ${chunk.length}B → ${out.length}B（转大写）`);
    this.push(out);
    callback();
  }

  doFlush(callback: Function): void {
    this.notify('doFlush：流结束，追加尾部标记');
    callback(null, '[PIPELINE-FLUSH-TAIL]');
  }
}

/** 场景9：双工流。写侧转大写后直接桥接（push）到读侧缓冲。
 *  ROM 行为：Duplex.end() 会立即终结读侧（setEndType → END 先于队列消费），
 *  因此不能采用"写侧入队、end 后再读"的回显模式，必须写读同步桥接。
 *  注意：内部不能声明名为 buf 的字段（会覆盖基类字节数组导致框架异常） */
class EchoDuplex extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    const text: string = typeof chunk === 'string' ? chunk : '';
    this.push(text.toUpperCase());
    callback();
  }

  doRead(size: number): void {
    // 数据已由 doWrite 直接 push 到读侧缓冲，此处无需补充数据；
    // 读侧 END 由框架在 end() 时经 setEndType 自动发出
  }
}

export class StreamPipeline {
  /** 流式场景（3/4/5）全部完成时回调，由 UI 层注入用于解锁按钮 */
  onDone: () => void = () => {
  };
  /** 场景3 写入的演示文件路径，供场景4 复用 */
  private lastWriteFile: string = '';

  /** 场景3：Writable 流式写入（沙箱文件，无需任何权限） */
  runWritableDemo(filesDir: string): void {
    const filePath: string = `${filesDir}/stream_write_demo.txt`;
    this.lastWriteFile = filePath;
    try {
      fs.unlinkSync(filePath);
    } catch (err) {
      // 文件不存在时忽略
    }
    const fd: number = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE).fd;
    LogUtil.info(TAG, `【场景3】Writable 流式写入开始：${filePath}`);

    const writer = new FileWritable(fd, (n: number, total: number) => {
      if (total <= CHUNK_SIZE * 3 || total % (CHUNK_SIZE * 25) === 0) {
        LogUtil.debug(TAG, `    doWrite 落盘 ${n}B（累计 ${total}B）`);
      }
    });

    writer.on('finish', () => {
      const size: number = fs.statSync(filePath).size;
      LogUtil.info(TAG, `3.4 finish 事件：全部数据落盘完成，文件大小 ${size}B（预期 ${WRITE_CHUNKS * CHUNK_SIZE}B）${size === WRITE_CHUNKS * CHUNK_SIZE ? '，一致' : '，不一致'}`);
      fs.closeSync(fd);
      this.onDone();
    });

    // 3.1 cork/uncork：cork 期间 write 仅进缓冲区，uncork 后批量写出。
    // 注意：本 ROM 的 doWrite 回调为同步递归排空，单次 uncork 的暂存量不能过大
    //（一次性 cork 400KB 实测同步递归爆栈），因此 cork/uncork 按小批进行。
    writer.cork();
    LogUtil.info(TAG, '3.1 cork()：进入强制缓冲状态，连续 write 5 块暂存缓冲区');
    for (let i = 0; i < 5; i++) {
      writer.write(this.makeChunk(i), 'utf8');
    }
    writer.uncork();
    LogUtil.info(TAG, '3.1 uncork()：解除缓冲，暂存的 5 块数据批量写出');

    // 3.2 水位线背压：cork 缓冲达到 writableHighWatermark（默认 16KB）时 write() 返回 false，
    // 与 Node 语义一致（数据照常入队，不丢失），由消费者按自身节奏消费
    writer.cork();
    let backpressureCount: number = 0;
    for (let i = 5; i < 15; i++) {
      const canContinue: boolean = writer.write(this.makeChunk(i), 'utf8');
      if (!canContinue) {
        backpressureCount++;
        if (backpressureCount === 1) {
          LogUtil.info(TAG, `3.2 第 ${i} 块 write() 返回 false：缓冲区 ${writer.writableLength}B 已达水位线 ${writer.writableHighWatermark}B（背压信号，数据不丢失）`);
        }
      }
    }
    LogUtil.info(TAG, `3.2 cork 写入 10 块 × ${CHUNK_SIZE}B，write() 返回 false ${backpressureCount} 次，缓冲区积压 ${writer.writableLength}B`);
    writer.uncork();
    LogUtil.info(TAG, '3.2 uncork()：解除缓冲，积压的 10 块数据批量落盘');

    // 其余 90 块常规写入（doWrite 同步落盘，缓冲即时排空）
    for (let i = 15; i < WRITE_CHUNKS; i++) {
      writer.write(this.makeChunk(i), 'utf8');
    }
    LogUtil.info(TAG, `3.2 共写入 ${WRITE_CHUNKS} 块 × ${CHUNK_SIZE}B`);

    // 3.3 end：结束写入，等待 finish 事件
    writer.end();
    LogUtil.info(TAG, '3.3 end()：结束写入，等待 finish 事件');
  }

  /** 场景4：Readable 流式读取（复用场景3 的文件；未跑场景3 时先生成数据） */
  runReadableDemo(filesDir: string): void {
    let filePath: string = this.lastWriteFile;
    if (filePath === '' || !fs.accessSync(filePath)) {
      // 场景3 未执行时，先生成一个 200KB 的演示文件
      filePath = `${filesDir}/stream_read_source.txt`;
      this.generateSourceFile(filePath);
      LogUtil.info(TAG, `【场景4】检测到场景3 未执行，已先生成演示文件 ${filePath}`);
    }
    const fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
    const size: number = fs.statSync(filePath).size;
    LogUtil.info(TAG, `【场景4】Readable 流式读取开始：${filePath}（${size}B，分块 ${CHUNK_SIZE}B）`);

    const reader = new FileReadable(fd, size, (index: number, bytes: number, done: boolean) => {
      if (index <= 3 || done) {
        LogUtil.debug(TAG, `    doRead 第 ${index} 块 ${bytes}B${done ? '（最后一块）' : ''}`);
      }
    });

    let chunks: number = 0;
    let received: number = 0;
    reader.on('data', (data: emitter.EventData) => {
      const chunk = data.data as Object as string;
      chunks++;
      received += chunk.length;
    });
    reader.on('end', () => {
      LogUtil.info(TAG, `4.2 end 事件：共收到 ${chunks} 块 / ${received}B，与文件大小 ${size}B ${received === size ? '一致' : '不一致'}`);
      LogUtil.info(TAG, '4.3 全程分块流转，未一次性整载文件（内存友好）');
      fs.closeSync(fd);
      this.onDone();
    });
    LogUtil.info(TAG, '4.1 doRead 分块 push → data 事件逐块送达消费者');
  }

  /** 场景5：Readable → Transform → Writable 三流完整流水线 */
  runPipelineDemo(filesDir: string): void {
    const filePath: string = `${filesDir}/stream_pipeline_demo.txt`;
    try {
      fs.unlinkSync(filePath);
    } catch (err) {
      // 文件不存在时忽略
    }
    const fd: number = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE).fd;
    LogUtil.info(TAG, '【场景5】三流流水线启动：Readable 产数 → Transform 大写加工 → Writable 落盘');

    const source = new GeneratorReadable(PIPELINE_BLOCKS, (index: number) => {
      if (index <= 3) {
        LogUtil.debug(TAG, `    [Readable] 产出第 ${index} 块`);
      }
    });
    const transformer = new UpperCaseTransform((info: string) => {
      LogUtil.debug(TAG, `    [Transform] ${info}`);
    });
    const sink = new FileWritable(fd, (_n: number, total: number) => {
      if (total === PIPELINE_BLOCKS * PIPELINE_BLOCK_SIZE + '[PIPELINE-FLUSH-TAIL]'.length) {
        LogUtil.debug(TAG, `    [Writable] 全部落盘 ${total}B`);
      }
    });

    let transformed: number = 0;
    // 5.1 三流串联：源 data → 转换 write；源 end → 转换 end；转换 data → 落盘 write；转换 end → 落盘 end
    source.on('data', (data: emitter.EventData) => {
      transformer.write(data.data as Object as string);
    });
    source.on('end', () => {
      transformer.end();
      LogUtil.info(TAG, `5.1 Readable 产出 ${PIPELINE_BLOCKS} 块完毕，级联关闭 Transform`);
    });
    transformer.on('data', (data: emitter.EventData) => {
      transformed++;
      if (transformed <= 3) {
        LogUtil.debug(TAG, `    [Transform] 第 ${transformed} 块加工完成 → Writable`);
      }
      sink.write(data.data as Object as string);
    });
    transformer.on('end', () => {
      sink.end();
      LogUtil.info(TAG, `5.2 Transform 处理完成 ${transformed} 块（含 doFlush 尾块），级联关闭 Writable`);
    });
    sink.on('finish', () => {
      const size: number = fs.statSync(filePath).size;
      LogUtil.info(TAG, `5.3 finish 事件：流水线完成，落盘 ${size}B`);
      // 5.4 用 FastBuffer 读回文件头校验加工结果（呼应场景1 的二进制读取能力）
      const headFd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      const head: ArrayBuffer = new ArrayBuffer(64);
      fs.readSync(headFd, head, { offset: 0, length: 64 });
      fs.closeSync(headFd);
      const headStr: string = fastbuffer.from(head).toString('utf8');
      LogUtil.info(TAG, `5.4 FastBuffer 读回文件头校验：${headStr.substring(0, 40)}...（已转大写）`);
      fs.closeSync(fd);
      this.onDone();
    });
  }

  /** 场景8：pipe 一行流水线——与场景5 相同拓扑，改用官方 pipe() 接线 */
  runPipeDemo(filesDir: string): void {
    const filePath: string = `${filesDir}/stream_pipe_demo.txt`;
    try {
      fs.unlinkSync(filePath);
    } catch (err) {
      // 文件不存在时忽略
    }
    const fd: number = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE).fd;
    LogUtil.info(TAG, '【场景8】pipe 流水线启动：source.pipe(transform) → transform.pipe(sink)');

    const source = new GeneratorReadable(PIPE_BLOCKS, (index: number) => {
      if (index <= 2) {
        LogUtil.debug(TAG, `    [Readable] 产出第 ${index} 块`);
      }
    }, PIPE_BLOCK_SIZE);
    const transformer = new UpperCaseTransform((_info: string) => {
    });
    const sink = new FileWritable(fd, (_n: number, _total: number) => {
    });

    // pipe 自动转发 data/end，但错误仍需各流自行监听
    source.on('error', (err: emitter.EventData) => {
      const e = err.data as Error;
      LogUtil.error(TAG, `8.x 源流出错：${e && e.message ? e.message : '未知错误'}`);
      this.onDone();
    });
    transformer.on('error', (err: emitter.EventData) => {
      const e = err.data as Error;
      LogUtil.error(TAG, `8.x 转换流出错：${e && e.message ? e.message : '未知错误'}`);
      this.onDone();
    });
    sink.on('error', (err: emitter.EventData) => {
      const e = err.data as Error;
      LogUtil.error(TAG, `8.x 落盘流出错：${e && e.message ? e.message : '未知错误'}`);
      this.onDone();
    });
    sink.on('finish', () => {
      const size: number = fs.statSync(filePath).size;
      const expected: number = PIPE_BLOCKS * PIPE_BLOCK_SIZE + '[PIPELINE-FLUSH-TAIL]'.length;
      LogUtil.info(TAG, `8.2 finish 事件：pipe 流水线完成，落盘 ${size}B（预期 ${expected}B）${size === expected ? '，一致' : '，不一致'}`);
      // 8.3 FastBuffer 读回文件头校验大写加工
      const headFd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      const head: ArrayBuffer = new ArrayBuffer(32);
      fs.readSync(headFd, head, { offset: 0, length: 32 });
      fs.closeSync(headFd);
      const headStr: string = fastbuffer.from(head).toString('utf8');
      LogUtil.info(TAG, `8.3 读回文件头：${headStr.substring(0, 20)}...（大写加工经 pipe 自动转发生效）`);
      fs.closeSync(fd);
      this.onDone();
    });

    // 8.1 两行 pipe 接线替代场景5 的手工事件级联（data/end 均由框架转发）
    LogUtil.info(TAG, '8.1 source.pipe(transform) 接线（data/end 由框架自动转发）');
    source.pipe(transformer);
    transformer.pipe(sink);
  }

  /** 场景9：Duplex 双工流——写侧桥接读侧的回显演示 */
  runDuplexDemo(): void {
    LogUtil.info(TAG, '【场景9】Duplex 双工流启动：doWrite 转大写并桥接读侧缓冲');

    const duplex = new EchoDuplex();
    const received: string[] = [];
    duplex.on('error', (err: emitter.EventData) => {
      const e = err.data as Error;
      LogUtil.error(TAG, `9.x 双流出错：${e && e.message ? e.message : '未知错误'}`);
      this.onDone();
    });
    duplex.on('finish', () => {
      LogUtil.info(TAG, '9.1 finish 事件：写侧数据全部消费完毕');
    });
    duplex.on('data', (data: emitter.EventData) => {
      const chunk = data.data as Object as string;
      received.push(chunk);
      LogUtil.info(TAG, `9.2 data 事件：读出 "${chunk}"（${chunk.length}B）`);
    });
    duplex.on('end', () => {
      const joined: string = received.join('');
      LogUtil.info(TAG, `9.3 end 事件：EOF 回送完成，共读回 ${received.length} 块：${received.join(' ')}`);
      LogUtil.info(TAG, `9.3 往返校验：${joined === 'HELLOSTREAM' ? '一致' : '不一致'}（hello/stream → 大写回显）`);
      this.onDone();
    });

    // 9.1 先进入流动模式再写入：写侧数据经 doWrite 桥接直达读侧 data 事件
    duplex.write('hello');
    duplex.write('stream');
    duplex.end();
  }

  /** 生成 4KB 文本块：块号前缀 + 填充字符 */
  private makeChunk(index: number): string {
    const prefix: string = `[CHUNK-${String(index).padStart(3, '0')}]`;
    return prefix + 'a'.repeat(CHUNK_SIZE - prefix.length);
  }

  /** 场景4 兜底：生成 200KB 演示源文件（50 块 × 4KB） */
  private generateSourceFile(filePath: string): void {
    const fd: number = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE).fd;
    for (let i = 0; i < 50; i++) {
      fs.writeSync(fd, this.makeChunk(i));
    }
    fs.closeSync(fd);
  }
}
