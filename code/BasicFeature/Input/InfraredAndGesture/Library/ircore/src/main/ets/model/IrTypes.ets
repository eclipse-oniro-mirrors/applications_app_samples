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

/** Default carrier frequency in hertz when a code or frame omits one (typical 38 kHz). */
const DEFAULT_CARRIER_FREQUENCY_HZ: number = 38000;
/** Default delay in milliseconds between two steps of a send job. */
const DEFAULT_STEP_DELAY_MS: number = 250;
/** Default repeat count when a library entry does not specify one. */
const DEFAULT_REPEAT_COUNT: number = 1;

/**
 * IR protocols supported by the sample. Every value maps to one compile branch
 * in IrCodeCompiler; RAW stands for a pre-encoded pulse sequence.
 */
export enum IrProtocol {
  /** NEC protocol: 32-bit frame, 8-bit address + inverse address + command + inverse command. */
  NEC = 'NEC',
  /** Philips RC-5 protocol: 14-bit Manchester encoded frame. */
  RC5 = 'RC5',
  /** Philips RC-6 protocol, reserved for future use and not compiled yet. */
  RC6 = 'RC6',
  /** Sony SIRC protocol: 12/15/20 bit LSB-first frame. */
  SONY = 'SONY',
  /** Raw pulse sequence, values already expressed in microseconds. */
  RAW = 'RAW'
}

/**
 * One IR library entry after parsing: protocol, payload text and the metadata
 * needed for sending and legal attribution.
 */
export class IrCode {
  /** Unique identifier built as brandId-deviceType-model-keySemantic. */
  public id: string = '';
  /** Protocol used to compile the payload into waveform frames. */
  public protocol: IrProtocol = IrProtocol.RAW;
  /** Carrier frequency in hertz; 38000 (38 kHz) when the entry omits it. */
  public frequencyHz: number = DEFAULT_CARRIER_FREQUENCY_HZ;
  /**
   * Protocol payload text. For NEC/SONY/RC5 a comma separated pair such as
   * "0x08,0xF7": NEC address+command, SONY data+bitCount, RC5 address+command.
   * For RAW an alternating mark/space pulse sequence in microseconds.
   */
  public payload: string = '';
  /** How many times the compiled frames are repeated in one send. */
  public repeatCount: number = DEFAULT_REPEAT_COUNT;
  /** Source name of the code, e.g. the bundled library name. */
  public source: string = '';
  /** License text of the code for legal attribution. */
  public license: string = '';
  /** Device brand display name. */
  public brand: string = '';
  /** Device model name. */
  public model: string = '';
  /** Semantic key name such as power or volume_up. */
  public keySemantic: string = '';
  /** Optional integrity checksum from the library file. */
  public checksum: string = '';
}

/**
 * One compiled waveform frame. The pattern is an alternating sequence of
 * mark (carrier on) and space (carrier off) durations in microseconds,
 * starting with a mark and normally having an even length.
 */
export class IrFrame {
  /** Zero-based frame index inside one compile result. */
  public index: number = 0;
  /** Pulse sequence in microseconds; every value must be greater than 0. */
  public pattern: number[] = [];
  /** Total waveform duration in microseconds, the sum of all pattern values. */
  public durationUs: number = 0;
}

/** Error codes reported by IrCodeCompiler when compilation fails. */
export enum IrCompileError {
  /** Compilation succeeded. */
  NONE = 'NONE',
  /** Payload text is empty or contains no usable value. */
  EMPTY_PAYLOAD = 'EMPTY_PAYLOAD',
  /** A payload value is out of range for the protocol. */
  INVALID_VALUE = 'INVALID_VALUE',
  /** Protocol has no compiler implementation, e.g. RC6. */
  UNSUPPORTED_PROTOCOL = 'UNSUPPORTED_PROTOCOL',
  /** Compiled frame exceeds the system pattern length limit. */
  TOO_LONG = 'TOO_LONG'
}

/** Outcome of compiling one IrCode: frames on success, error details otherwise. */
export class IrCompileResult {
  /** True when frames were produced. */
  public ok: boolean = false;
  /** Compiled waveform frames, empty when compilation failed. */
  public frames: IrFrame[] = [];
  /** Machine readable error code, NONE on success. */
  public error: IrCompileError = IrCompileError.NONE;
  /** Human readable failure detail, empty on success. */
  public message: string = '';
}

/**
 * Device infrared emission capability probed once at startup.
 * When hasEmitter is false the reason explains why sending is unavailable.
 */
export class IrCapability {
  /** Whether the device exposes an infrared emitter. */
  public hasEmitter: boolean = false;
  /** Lowest supported carrier frequency in hertz, 0 when unknown. */
  public minFrequencyHz: number = 0;
  /** Highest supported carrier frequency in hertz, 0 when unknown. */
  public maxFrequencyHz: number = 0;
  /** Whether the default 38 kHz carrier lies inside the supported range. */
  public supportsDefaultFrequency: boolean = false;
  /** True means sending is disabled and the UI should be read-only. */
  public readOnly: boolean = true;
  /** Explanation when the device cannot emit infrared. */
  public reason: string = '';
}

/** Normalized result codes of one transmit attempt. */
export enum TransmitResultCode {
  /** Waveform was handed to the emitter without error. */
  OK = 'OK',
  /** Permission denied, mapped from BusinessError 201. */
  PERM_DENIED = 'PERM_DENIED',
  /** Invalid parameter, mapped from BusinessError 401. */
  PARAM_ERROR = 'PARAM_ERROR',
  /** Device has no infrared emitter. */
  NO_EMITTER = 'NO_EMITTER',
  /** Serial queue is busy with another job. */
  BUSY = 'BUSY',
  /** Any other failure. */
  UNKNOWN = 'UNKNOWN'
}

/** Result of one transmit attempt with duration for UI feedback. */
export class TransmitResult {
  /** Normalized result code. */
  public code: TransmitResultCode = TransmitResultCode.UNKNOWN;
  /** Wall time spent on the attempt in milliseconds. */
  public durationMs: number = 0;
  /** User readable message provided by TransmitErrorMapper. */
  public message: string = '';
}

/** Lifecycle state of one step inside a send job. */
export enum SendState {
  /** Step accepted, not started yet. */
  PENDING = 'PENDING',
  /** Frames of the step are being transmitted. */
  SENDING = 'SENDING',
  /** All frames of the step were sent successfully. */
  SUCCESS = 'SUCCESS',
  /** At least one frame of the step failed. */
  FAILED = 'FAILED'
}

/** Progress snapshot pushed to listeners while a send job runs. */
export class SendProgress {
  /** Ticket of the running job. */
  public ticketId: string = '';
  /** Scene run the job belongs to, empty for manual tests. */
  public sceneRunId: string = '';
  /** Zero-based index of the current step. */
  public stepIndex: number = 0;
  /** Total number of steps in the job. */
  public totalSteps: number = 0;
  /** Target device of the current step. */
  public deviceId: string = '';
  /** Target key of the current step. */
  public keyId: string = '';
  /** Current lifecycle state of the step. */
  public state: SendState = SendState.PENDING;
  /** Result code of the last transmit attempt of the step. */
  public resultCode: TransmitResultCode = TransmitResultCode.UNKNOWN;
}

/** Origin of a send job. */
export enum SendSource {
  /** Manual key test from the console UI. */
  MANUAL = 'MANUAL',
  /** Automated scene run playback. */
  SCENE = 'SCENE'
}

/**
 * One transmittable frame in a send step. The pattern is an alternating
 * mark/space pulse sequence in microseconds and frequencyHz is the carrier
 * frequency in hertz (38000 when the step does not override it).
 */
export class SendFrame {
  /** Carrier frequency in hertz for this frame. */
  public frequencyHz: number = DEFAULT_CARRIER_FREQUENCY_HZ;
  /** Pulse sequence in microseconds; every value must be greater than 0. */
  public pattern: number[] = [];
}

/** One step of a send job: all frames of one device key. */
export class SendStep {
  /** Zero-based step index. */
  public index: number = 0;
  /** Target device identifier. */
  public deviceId: string = '';
  /** Target key identifier. */
  public keyId: string = '';
  /** Frames sent one after another with a fixed inter-frame interval. */
  public frames: SendFrame[] = [];
  /** Delay in milliseconds before the next step starts. */
  public delayMs: number = DEFAULT_STEP_DELAY_MS;
}

/** A complete send request accepted by IrSendQueue. */
export class SendJob {
  /** Ticket assigned by the queue when the job is accepted. */
  public ticketId: string = '';
  /** Scene run the job belongs to, empty for manual tests. */
  public sceneRunId: string = '';
  /** Whether the job comes from a manual test or a scene run. */
  public source: SendSource = SendSource.MANUAL;
  /** Steps executed serially. */
  public steps: SendStep[] = [];
}

/** Reply of IrSendQueue.enqueue: acceptance plus ticket or rejection reason. */
export class SendTicket {
  /** Whether the queue accepted the job. */
  public accepted: boolean = false;
  /** Ticket identifier, only meaningful when accepted. */
  public ticketId: string = '';
  /** Rejection reason such as BUSY, empty when accepted. */
  public reason: string = '';
}

/** One brand section of the bundled IR library index. */
export class IrBrandEntry {
  /** Stable brand identifier used by code files. */
  public brandId: string = '';
  /** Brand display name. */
  public brandName: string = '';
  /** Device types covered by this brand, e.g. tv or stb. */
  public deviceTypes: string[] = [];
  /** Known model names of this brand. */
  public models: string[] = [];
  /** Source name of the brand data. */
  public source: string = '';
  /** License text of the brand data. */
  public license: string = '';
  /** Library file name relative to the ir-library directory. */
  public file: string = '';
}

/** Root object of the bundled IR library index file. */
export class IrLibraryIndex {
  /** Index format version. */
  public version: string = '';
  /** Brand entries in index order. */
  public brands: IrBrandEntry[] = [];
}

/** One code resolved from the library together with its brand metadata. */
export class IrLibraryCode {
  /** Brand identifier the code belongs to. */
  public brandId: string = '';
  /** Model name the code targets. */
  public model: string = '';
  /** Device type the code targets. */
  public deviceType: string = '';
  /** Parsed code ready for compilation. */
  public code: IrCode = new IrCode();
}
