/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { A2dpModel, A2dpJson } from '../model/A2dpModel';
import {
  BluetoothConstants,
  BluetoothConnectionState,
  A2dpConnectionState,
  BluetoothProfileType
} from '../constants/BluetoothConstants';
import { Logger } from '../utils/basic/Logger';

/**
 * @interface A2dpAudioCodecInfo
 * @description Detailed information about an A2DP audio codec supported by the device.
 * This interface provides codec-specific parameters that determine audio quality,
 * latency, and compatibility between the source and sink devices.
 */
export interface A2dpAudioCodecInfo {
  /** The codec identifier (e.g., SBC, AAC, aptX, LDAC) */
  codecId: number;
  /** Human-readable name of the codec */
  codecName: string;
  /** Maximum bit rate supported by this codec in bits per second */
  maxBitRate: number;
  /** Minimum bit rate supported by this codec in bits per second */
  minBitRate: number;
  /** Supported sample rates in Hz (e.g., 44100, 48000, 96000) */
  sampleRates: number[];
  /** Supported bit depths (e.g., 16, 24, 32) */
  bitDepths: number[];
  /** Channel modes supported (mono, stereo, dual_channel) */
  channelModes: string[];
  /** Whether this codec is the currently active codec */
  isActive: boolean;
  /** Codec-specific quality rating from 0.0 to 1.0 */
  qualityRating: number;
  /** Codec-specific latency in milliseconds */
  latencyMs: number;
  /** Whether the codec supports high-resolution audio */
  supportsHiRes: boolean;
  /** Vendor-specific codec identifier for proprietary codecs */
  vendorId: number;
  /** Vendor-specific codec capability bits */
  vendorCodecId: number;
}

/**
 * @interface A2dpPlaybackInfo
 * @description Comprehensive information about the current A2DP playback state.
 * Includes track metadata, playback position, and source device information.
 */
export interface A2dpPlaybackInfo {
  /** Name of the currently playing track */
  trackName: string;
  /** Artist name of the currently playing track */
  artistName: string;
  /** Album name of the currently playing track */
  albumName: string;
  /** Current playback position in milliseconds */
  positionMs: number;
  /** Total duration of the track in milliseconds */
  durationMs: number;
  /** Whether audio is currently playing */
  isPlaying: boolean;
  /** Whether playback is paused */
  isPaused: boolean;
  /** Current playback speed (1.0 = normal, 2.0 = double speed, etc.) */
  playbackSpeed: number;
  /** Audio source type identifier */
  sourceType: number;
  /** Name of the audio source application */
  sourceAppName: string;
  /** Current volume level (0-100) */
  volume: number;
  /** Whether the volume is muted */
  isMuted: boolean;
  /** Shuffle mode enabled flag */
  shuffleEnabled: boolean;
  /** Repeat mode (0=off, 1=one, 2=all) */
  repeatMode: number;
  /** Current track index in the playlist */
  trackIndex: number;
  /** Total number of tracks in the playlist */
  totalTracks: number;
  /** Media artwork URL if available */
  artworkUrl: string;
  /** Genre of the current track */
  genre: string;
  /** Year of the current track */
  year: number;
}

/**
 * @interface A2dpStreamConfig
 * @description Configuration parameters for the A2DP audio stream.
 * Controls audio quality, buffering, and codec selection.
 */
export interface A2dpStreamConfig {
  /** Selected audio codec ID */
  codecId: number;
  /** Audio sample rate in Hz */
  sampleRate: number;
  /** Audio bit depth */
  bitDepth: number;
  /** Number of audio channels (1=mono, 2=stereo) */
  channels: number;
  /** Audio bit rate in bits per second */
  bitRate: number;
  /** Buffer size in bytes */
  bufferSize: number;
  /** Buffer duration in milliseconds */
  bufferDurationMs: number;
  /** Whether to use high-quality mode */
  highQualityMode: boolean;
  /** Whether adaptive bitrate is enabled */
  adaptiveBitrate: boolean;
  /** Maximum latency target in milliseconds */
  maxLatencyMs: number;
}

/**
 * @interface A2dpDeviceCapability
 * @description Represents the full A2DP capability set of a connected device.
 * Used during capability negotiation to determine the best common configuration.
 */
export interface A2dpDeviceCapability {
  /** Device identifier */
  deviceId: string;
  /** Device name */
  deviceName: string;
  /** List of supported codecs with their parameters */
  supportedCodecs: A2dpAudioCodecInfo[];
  /** Maximum number of simultaneous audio channels */
  maxChannels: number;
  /** Whether the device supports A2DP sink role */
  supportsSink: boolean;
  /** Whether the device supports A2DP source role */
  supportsSource: boolean;
  /** Whether the device supports AVRCP passthrough commands */
  supportsAvrcp: boolean;
  /** Preferred codec ID for this device */
  preferredCodecId: number;
  /** Maximum supported sample rate */
  maxSampleRate: number;
  /** Maximum supported bit depth */
  maxBitDepth: number;
  /** Device class for audio (headphones, speaker, car audio, etc.) */
  audioDeviceClass: string;
  /** Whether the device supports media browsing */
  supportsMediaBrowsing: boolean;
  /** Whether the device supports now playing info */
  supportsNowPlaying: boolean;
  /** Firmware version of the device */
  firmwareVersion: string;
  /** Manufacturer name */
  manufacturer: string;
}

/**
 * @interface A2dpQualityMetrics
 * @description Real-time quality metrics for the A2DP audio stream.
 * Useful for monitoring audio quality and detecting connection issues.
 */
export interface A2dpQualityMetrics {
  /** Current audio latency in milliseconds */
  currentLatencyMs: number;
  /** Average audio latency over the session */
  averageLatencyMs: number;
  /** Maximum audio latency observed */
  maxLatencyMs: number;
  /** Number of audio buffer underruns */
  underrunCount: number;
  /** Number of audio buffer overruns */
  overrunCount: number;
  /** Number of retransmissions */
  retransmissionCount: number;
  /** Packet loss rate as a percentage (0-100) */
  packetLossRate: number;
  /** Current signal quality (0-100) */
  signalQuality: number;
  /** Current effective bit rate */
  effectiveBitRate: number;
  /** Total bytes transmitted */
  totalBytesTransmitted: number;
  /** Total bytes received */
  totalBytesReceived: number;
  /** Session start time in milliseconds since epoch */
  sessionStartTime: number;
  /** Session duration in milliseconds */
  sessionDurationMs: number;
  /** Number of codec switches during the session */
  codecSwitchCount: number;
  /** Whether the stream is currently stable */
  isStable: boolean;
  /** Jitter in milliseconds */
  jitterMs: number;
  /** Signal-to-noise ratio in dB */
  snrDb: number;
}

/**
 * @class A2dpService
 * @description Service class for managing the Bluetooth A2DP (Advanced Audio Distribution Profile).
 * A2DP defines how high quality audio is streamed from one device to another over a Bluetooth
 * connection. It is the standard profile used for streaming music to Bluetooth headphones,
 * speakers, and car audio systems.
 *
 * <p>This service provides comprehensive functionality including:</p>
 * <ul>
 *   <li>Device connection and disconnection management</li>
 *   <li>Audio codec negotiation and selection</li>
 *   <li>Playback control (play, pause, stop, skip, rewind)</li>
 *   <li>Volume management with absolute volume support</li>
 *   <li>Audio quality monitoring and metrics</li>
 *   <li>Device capability discovery and management</li>
 *   <li>Stream configuration and optimization</li>
 *   <li>Connection state change notifications via callbacks</li>
 *   <li>Operation history tracking for debugging</li>
 *   <li>Performance tracing via hiTraceMeter</li>
 * </ul>
 *
 * <p>The service follows a lifecycle pattern:</p>
 * <ol>
 *   <li>Create an instance of A2dpService</li>
 *   <li>Call initialize() to set up the service and prepare for connections</li>
 *   <li>Use connect/disconnect/play/pause methods to manage audio streaming</li>
 *   <li>Register callbacks to receive connection state and playback updates</li>
 *   <li>Call destroy() when the service is no longer needed to release resources</li>
 * </ol>
 *
 * @example
 * ```typescript
 * const a2dpService = new A2dpService();
 * await a2dpService.initialize();
 * a2dpService.addConnectionCallback((state) => {
 *   console.info(`A2DP connection state: ${state}`);
 * });
 * await a2dpService.connect('device-id-123');
 * await a2dpService.play();
 * ```
 *
 * @since 26.0.0
 */
export class A2dpService {
  /** Service name identifier for logging and tracing */
  private readonly serviceName: string = 'A2dpService';

  /** Current A2DP model containing audio state data */
  private model: A2dpModel = new A2dpModel();

  /** Whether the service has been initialized */
  private isInitialized: boolean = false;

  /** Current connection state of the A2DP profile */
  private connectionState: BluetoothConnectionState = BluetoothConnectionState.DISCONNECTED;

  /** Current A2DP-specific connection state */
  private a2dpState: A2dpConnectionState = A2dpConnectionState.NOT_CONNECTED;

  /** List of registered connection state change callbacks */
  private connectionCallbacks: Array<(state: BluetoothConnectionState) => void> = [];

  /** List of registered data change callbacks */
  private dataCallbacks: Array<(model: A2dpModel) => void> = [];

  /** List of registered playback state callbacks */
  private playbackCallbacks: Array<(info: A2dpPlaybackInfo) => void> = [];

  /** List of registered quality metric callbacks */
  private qualityCallbacks: Array<(metrics: A2dpQualityMetrics) => void> = [];

  /** History of operations performed by this service */
  private operationHistory: Array<{ operation: string; timestamp: number; success: boolean; details: string }> = [];

  /** Maximum number of operations to retain in history */
  private maxHistorySize: number = 200;

  /** Connected device IDs */
  private connectedDeviceIds: string[] = [];

  /** Supported audio codecs for the current connection */
  private supportedCodecs: A2dpAudioCodecInfo[] = [];

  /** Current stream configuration */
  private streamConfig: A2dpStreamConfig | null = null;

  /** Device capabilities for connected devices */
  private deviceCapabilities: Map<string, A2dpDeviceCapability> = new Map();

  /** Quality metrics for the current session */
  private qualityMetrics: A2dpQualityMetrics | null = null;

  /** Playback information for the current track */
  private playbackInfo: A2dpPlaybackInfo | null = null;

  /** Audio source device identifier */
  private audioSourceDeviceId: string = '';

  /** Whether absolute volume is supported */
  private supportsAbsoluteVolume: boolean = false;

  /** Whether the audio stream is active */
  private isStreamActive: boolean = false;

  /** Session start timestamp */
  private sessionStartTime: number = 0;

  /** Total bytes transferred in current session */
  private totalBytesTransferred: number = 0;

  /** Codec switch count */
  private codecSwitchCount: number = 0;

  /**
   * Default A2DP codec set (SBC, AAC, aptX, aptX HD, LDAC) with their standard parameters.
   * Read-only template: every service instance works on its own copy so that the
   * per-connection "active" flag never leaks between instances.
   */
  private static readonly DEFAULT_CODECS: A2dpAudioCodecInfo[] = [
    {
      codecId: 0x00,
      codecName: 'SBC',
      maxBitRate: 320000,
      minBitRate: 192000,
      sampleRates: [16000, 32000, 44100, 48000],
      bitDepths: [4, 8, 12, 16],
      channelModes: ['mono', 'dual_channel', 'stereo', 'joint_stereo'],
      isActive: true,
      qualityRating: 0.6,
      latencyMs: 40,
      supportsHiRes: false,
      vendorId: 0,
      vendorCodecId: 0
    },
    {
      codecId: 0x02,
      codecName: 'AAC',
      maxBitRate: 320000,
      minBitRate: 8000,
      sampleRates: [8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000],
      bitDepths: [16, 24],
      channelModes: ['mono', 'stereo'],
      isActive: false,
      qualityRating: 0.7,
      latencyMs: 35,
      supportsHiRes: false,
      vendorId: 0,
      vendorCodecId: 0
    },
    {
      codecId: 0x01,
      codecName: 'aptX',
      maxBitRate: 352000,
      minBitRate: 352000,
      sampleRates: [44100, 48000],
      bitDepths: [16],
      channelModes: ['stereo'],
      isActive: false,
      qualityRating: 0.75,
      latencyMs: 30,
      supportsHiRes: false,
      vendorId: 0x0000004F,
      vendorCodecId: 0x0001
    },
    {
      codecId: 0x03,
      codecName: 'aptX HD',
      maxBitRate: 576000,
      minBitRate: 576000,
      sampleRates: [44100, 48000],
      bitDepths: [24],
      channelModes: ['stereo'],
      isActive: false,
      qualityRating: 0.85,
      latencyMs: 32,
      supportsHiRes: true,
      vendorId: 0x0000004F,
      vendorCodecId: 0x0002
    },
    {
      codecId: 0x04,
      codecName: 'LDAC',
      maxBitRate: 990000,
      minBitRate: 303000,
      sampleRates: [44100, 48000, 88200, 96000],
      bitDepths: [16, 24, 32],
      channelModes: ['mono', 'dual_channel', 'stereo'],
      isActive: false,
      qualityRating: 0.95,
      latencyMs: 25,
      supportsHiRes: true,
      vendorId: 0x0000012D,
      vendorCodecId: 0x00AA
    }
  ];

  /**
   * @method initialize
   * @description Initializes the A2DP service and prepares it for audio connections.
   * This method must be called before any other service methods. It sets up the internal
   * state, initializes the model, registers default codecs, and prepares the service
   * for device connections.
   *
   * <p>Initialization includes:</p>
   * <ul>
   *   <li>Setting the service state to initialized</li>
   *   <li>Resetting the A2DP model to default values</li>
   *   <li>Registering default audio codecs (SBC, AAC, aptX, LDAC)</li>
   *   <li>Initializing quality metrics tracking</li>
   *   <li>Setting up playback info defaults</li>
   *   <li>Logging the initialization event</li>
   *   <li>Recording the operation in history</li>
   *   <li>Tracing via hiTraceMeter for performance monitoring</li>
   * </ul>
   *
   * @returns {Promise<boolean>} A promise that resolves to true if initialization was successful,
   *          or false if the service was already initialized.
   * @throws {Error} If a critical initialization error occurs.
   *
   * @example
   * ```typescript
   * const success = await a2dpService.initialize();
   * if (success) {
   *   console.info('A2DP service ready');
   * }
   * ```
   */
  async initialize(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_initialize`, 0);
    Logger.info(BluetoothConstants.TAG, `Initializing ${this.serviceName}`);

    try {
      if (this.isInitialized) {
        hilog.warn(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s already initialized',
          this.serviceName);
        this.addHistoryEntry('initialize', false, 'Already initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
        return false;
      }

      this.model = new A2dpModel();
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.a2dpState = A2dpConnectionState.NOT_CONNECTED;
      this.operationHistory = [];
      this.connectedDeviceIds = [];
      this.supportedCodecs = [];
      this.streamConfig = null;
      this.deviceCapabilities = new Map();
      this.qualityMetrics = null;
      this.playbackInfo = null;
      this.audioSourceDeviceId = '';
      this.supportsAbsoluteVolume = false;
      this.isStreamActive = false;
      this.sessionStartTime = 0;
      this.totalBytesTransferred = 0;
      this.codecSwitchCount = 0;

      this.registerDefaultCodecs();
      this.initializeQualityMetrics();
      this.initializePlaybackInfo();

      this.isInitialized = true;
      this.addHistoryEntry('initialize', true, 'Service initialized successfully');

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s initialized successfully',
        this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
      return true;
    } catch (error) {
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s initialization failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      this.addHistoryEntry('initialize', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
      return false;
    }
  }

  /**
   * @method registerDefaultCodecs
   * @description Registers the default set of A2DP audio codecs that are commonly
   * supported by Bluetooth audio devices. This includes SBC (mandatory), AAC,
   * aptX, aptX HD, and LDAC codecs with their standard parameters.
   * @private
   */
  private registerDefaultCodecs(): void {
    this.supportedCodecs = A2dpService.DEFAULT_CODECS.map(
      (codec: A2dpAudioCodecInfo) => A2dpService.cloneCodec(codec));
    hilog.debug(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, 'Registered %{public}d default A2DP codecs',
      this.supportedCodecs.length);
  }

  /**
   * @method cloneCodec
   * @description Builds an independent copy of a default codec entry so that the shared
   * template is never mutated by per-instance state such as the active flag.
   * @param {A2dpAudioCodecInfo} codec - The codec entry to copy.
   * @returns {A2dpAudioCodecInfo} The copy, with its own sample rate / bit depth / channel mode lists.
   * @private
   */
  private static cloneCodec(codec: A2dpAudioCodecInfo): A2dpAudioCodecInfo {
    return {
      codecId: codec.codecId,
      codecName: codec.codecName,
      maxBitRate: codec.maxBitRate,
      minBitRate: codec.minBitRate,
      sampleRates: codec.sampleRates.slice(0),
      bitDepths: codec.bitDepths.slice(0),
      channelModes: codec.channelModes.slice(0),
      isActive: codec.isActive,
      qualityRating: codec.qualityRating,
      latencyMs: codec.latencyMs,
      supportsHiRes: codec.supportsHiRes,
      vendorId: codec.vendorId,
      vendorCodecId: codec.vendorCodecId
    };
  }

  /**
   * @method initializeQualityMetrics
   * @description Initializes the quality metrics tracking structure with default values.
   * This sets up the baseline for monitoring audio stream quality during the session.
   * @private
   */
  private initializeQualityMetrics(): void {
    this.qualityMetrics = {
      currentLatencyMs: 0,
      averageLatencyMs: 0,
      maxLatencyMs: 0,
      underrunCount: 0,
      overrunCount: 0,
      retransmissionCount: 0,
      packetLossRate: 0,
      signalQuality: 100,
      effectiveBitRate: 0,
      totalBytesTransmitted: 0,
      totalBytesReceived: 0,
      sessionStartTime: Date.now(),
      sessionDurationMs: 0,
      codecSwitchCount: 0,
      isStable: true,
      jitterMs: 0,
      snrDb: 0
    };
  }

  /**
   * @method initializePlaybackInfo
   * @description Initializes the playback information structure with default values.
   * Sets up the track metadata and playback state for the initial idle state.
   * @private
   */
  private initializePlaybackInfo(): void {
    this.playbackInfo = {
      trackName: '',
      artistName: '',
      albumName: '',
      positionMs: 0,
      durationMs: 0,
      isPlaying: false,
      isPaused: false,
      playbackSpeed: 1.0,
      sourceType: 0,
      sourceAppName: '',
      volume: 50,
      isMuted: false,
      shuffleEnabled: false,
      repeatMode: 0,
      trackIndex: 0,
      totalTracks: 0,
      artworkUrl: '',
      genre: '',
      year: 0
    };
  }

  /**
   * @method connect
   * @description Establishes an A2DP audio connection with the specified Bluetooth device.
   * This method initiates the audio streaming channel setup, negotiates codec parameters,
   * and prepares the device for audio transmission.
   *
   * <p>The connection process involves:</p>
   * <ol>
   *   <li>Validating the device ID parameter</li>
   *   <li>Checking if already connected to this device</li>
   *   <li>Initiating the A2DP signaling channel</li>
   *   <li>Negotiating audio codec parameters</li>
   *   <li>Establishing the audio streaming channel</li>
   *   <li>Updating connection state and notifying callbacks</li>
   *   <li>Starting quality metrics tracking</li>
   * </ol>
   *
   * @param {string} deviceId - The unique identifier of the Bluetooth device to connect to.
   *        This should be a valid device ID obtained from device scanning or pairing.
   * @returns {Promise<boolean>} A promise that resolves to true if the connection was
   *          successfully established, or false if the connection failed.
   *
   * @example
   * ```typescript
   * const connected = await a2dpService.connect(BluetoothConstants.MOCK_MAC_ADDRESS);
   * if (connected) {
   *   console.info('Audio streaming ready');
   * }
   * ```
   */
  async connect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_connect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} connecting to device: ${deviceId}`);

    try {
      if (!this.isInitialized) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s not initialized', this.serviceName);
        this.addHistoryEntry('connect', false, 'Service not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return false;
      }

      if (!deviceId || deviceId.length === 0) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s invalid device ID',
          this.serviceName);
        this.addHistoryEntry('connect', false, 'Invalid device ID');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return false;
      }

      if (this.connectedDeviceIds.includes(deviceId)) {
        hilog.warn(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s already connected to %{public}s',
          this.serviceName, deviceId);
        this.addHistoryEntry('connect', false, 'Already connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return true;
      }

      this.connectionState = BluetoothConnectionState.CONNECTING;
      this.a2dpState = A2dpConnectionState.CONNECTING;
      this.notifyConnectionCallbacks();

      // Simulate connection delay
      await this.simulateConnectionDelay(800);

      this.applyConnectedState(deviceId);

      this.model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      this.notifyConnectionCallbacks();
      this.notifyDataCallbacks();

      this.addHistoryEntry('connect', true, `Connected to ${deviceId}`);
      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s connected to %{public}s',
        this.serviceName, deviceId);
      hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
      return true;
    } catch (error) {
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.a2dpState = A2dpConnectionState.NOT_CONNECTED;
      this.notifyConnectionCallbacks();
      this.addHistoryEntry('connect', false, `Error: ${JSON.stringify(error)}`);
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s connect failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
      return false;
    }
  }

  /**
   * @method applyConnectedState
   * @description Records a successful connection: registers the device as the audio source,
   * switches the service to the connected state and restarts the session counters.
   * @param {string} deviceId - The device that has just been connected.
   * @private
   */
  private applyConnectedState(deviceId: string): void {
    this.connectedDeviceIds.push(deviceId);
    this.audioSourceDeviceId = deviceId;
    this.connectionState = BluetoothConnectionState.CONNECTED;
    this.a2dpState = A2dpConnectionState.CONNECTED;
    this.isStreamActive = true;
    this.sessionStartTime = Date.now();
    this.totalBytesTransferred = 0;
    if (this.qualityMetrics) {
      this.qualityMetrics.sessionStartTime = this.sessionStartTime;
    }
  }

  /**
   * @method disconnect
   * @description Disconnects the A2DP audio connection from the specified device.
   * This tears down the audio streaming channel and releases associated resources.
   *
   * @param {string} deviceId - The unique identifier of the device to disconnect from.
   * @returns {Promise<boolean>} A promise that resolves to true if disconnection was successful.
   */
  async disconnect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_disconnect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} disconnecting from device: ${deviceId}`);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('disconnect', false, 'Service not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
        return false;
      }

      const index: number = this.connectedDeviceIds.indexOf(deviceId);
      if (index === -1) {
        this.addHistoryEntry('disconnect', false, 'Device not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
        return false;
      }

      this.connectionState = BluetoothConnectionState.DISCONNECTING;
      this.a2dpState = A2dpConnectionState.DISCONNECTING;
      this.notifyConnectionCallbacks();

      await this.simulateConnectionDelay(300);

      this.connectedDeviceIds.splice(index, 1);
      this.isStreamActive = false;

      if (this.audioSourceDeviceId === deviceId) {
        this.audioSourceDeviceId = '';
      }

      if (this.connectedDeviceIds.length === 0) {
        this.connectionState = BluetoothConnectionState.DISCONNECTED;
        this.a2dpState = A2dpConnectionState.NOT_CONNECTED;
        this.model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
        this.model.reset();
      } else {
        this.connectionState = BluetoothConnectionState.CONNECTED;
        this.a2dpState = A2dpConnectionState.CONNECTED;
      }

      this.notifyConnectionCallbacks();
      this.notifyDataCallbacks();
      this.addHistoryEntry('disconnect', true, `Disconnected from ${deviceId}`);

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s disconnected from %{public}s',
        this.serviceName, deviceId);
      hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('disconnect', false, `Error: ${JSON.stringify(error)}`);
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s disconnect failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
      return false;
    }
  }

  /**
   * @method play
   * @description Starts or resumes audio playback on the connected A2DP device.
   * Sends the AVDTP Start command to begin audio streaming.
   *
   * @returns {Promise<boolean>} A promise that resolves to true if playback started successfully.
   */
  async play(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_play`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} play requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('play', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_play`, 0);
        return false;
      }

      this.model.isPlaying = true;
      if (this.playbackInfo) {
        this.playbackInfo.isPlaying = true;
        this.playbackInfo.isPaused = false;
      }

      this.notifyDataCallbacks();
      this.notifyPlaybackCallbacks();
      this.addHistoryEntry('play', true, 'Playback started');

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s playback started', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_play`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('play', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_play`, 0);
      return false;
    }
  }

  /**
   * @method pause
   * @description Pauses audio playback on the connected A2DP device.
   * Sends the AVDTP Suspend command to temporarily halt audio streaming.
   *
   * @returns {Promise<boolean>} A promise that resolves to true if playback was paused successfully.
   */
  async pause(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_pause`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} pause requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('pause', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_pause`, 0);
        return false;
      }

      this.model.isPlaying = false;
      if (this.playbackInfo) {
        this.playbackInfo.isPlaying = false;
        this.playbackInfo.isPaused = true;
      }

      this.notifyDataCallbacks();
      this.notifyPlaybackCallbacks();
      this.addHistoryEntry('pause', true, 'Playback paused');

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s playback paused', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_pause`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('pause', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_pause`, 0);
      return false;
    }
  }

  /**
   * @method stop
   * @description Stops audio playback and resets the playback position.
   * Unlike pause, stop fully terminates the audio stream and resets position to 0.
   *
   * @returns {Promise<boolean>} A promise that resolves to true if playback was stopped successfully.
   */
  async stop(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_stop`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} stop requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('stop', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_stop`, 0);
        return false;
      }

      this.model.isPlaying = false;
      this.model.playbackPosition = 0;
      if (this.playbackInfo) {
        this.playbackInfo.isPlaying = false;
        this.playbackInfo.isPaused = false;
        this.playbackInfo.positionMs = 0;
      }

      this.notifyDataCallbacks();
      this.notifyPlaybackCallbacks();
      this.addHistoryEntry('stop', true, 'Playback stopped');

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s playback stopped', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_stop`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('stop', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_stop`, 0);
      return false;
    }
  }

  /**
   * @method skipForward
   * @description Skips to the next track in the playlist.
   * Sends the AVRCP Forward command to the audio source device.
   *
   * @returns {Promise<boolean>} A promise that resolves to true if skip was successful.
   */
  async skipForward(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_skipForward`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} skip forward requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('skipForward', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_skipForward`, 0);
        return false;
      }

      if (this.playbackInfo && this.playbackInfo.totalTracks > 0) {
        const nextIndex: number = (this.playbackInfo.trackIndex + 1) % this.playbackInfo.totalTracks;
        this.playbackInfo.trackIndex = nextIndex;
        this.playbackInfo.positionMs = 0;
        this.model.playbackPosition = 0;
      }

      this.notifyDataCallbacks();
      this.notifyPlaybackCallbacks();
      this.addHistoryEntry('skipForward', true, 'Skipped to next track');

      hiTraceMeter.finishTrace(`${this.serviceName}_skipForward`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('skipForward', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_skipForward`, 0);
      return false;
    }
  }

  /**
   * @method skipBackward
   * @description Skips to the previous track in the playlist.
   * Sends the AVRCP Backward command to the audio source device.
   *
   * @returns {Promise<boolean>} A promise that resolves to true if skip was successful.
   */
  async skipBackward(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_skipBackward`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} skip backward requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('skipBackward', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_skipBackward`, 0);
        return false;
      }

      if (this.playbackInfo && this.playbackInfo.totalTracks > 0) {
        const prevIndex: number =
          (this.playbackInfo.trackIndex - 1 + this.playbackInfo.totalTracks) % this.playbackInfo.totalTracks;
        this.playbackInfo.trackIndex = prevIndex;
        this.playbackInfo.positionMs = 0;
        this.model.playbackPosition = 0;
      }

      this.notifyDataCallbacks();
      this.notifyPlaybackCallbacks();
      this.addHistoryEntry('skipBackward', true, 'Skipped to previous track');

      hiTraceMeter.finishTrace(`${this.serviceName}_skipBackward`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('skipBackward', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_skipBackward`, 0);
      return false;
    }
  }

  /**
   * @method setVolume
   * @description Sets the audio volume level for the A2DP connection.
   * If absolute volume is supported, this adjusts the volume on the remote device directly.
   *
   * @param {number} volume - The volume level to set, from 0 (mute) to 100 (maximum).
   * @returns {Promise<boolean>} A promise that resolves to true if the volume was set successfully.
   */
  async setVolume(volume: number): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_setVolume`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} set volume: ${volume}`);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('setVolume', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_setVolume`, 0);
        return false;
      }

      const clampedVolume: number = Math.max(0, Math.min(100, Math.round(volume)));
      this.model.volume = clampedVolume;
      if (this.playbackInfo) {
        this.playbackInfo.volume = clampedVolume;
        this.playbackInfo.isMuted = clampedVolume === 0;
      }

      this.notifyDataCallbacks();
      this.notifyPlaybackCallbacks();
      this.addHistoryEntry('setVolume', true, `Volume set to ${clampedVolume}`);

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s volume set to %{public}d',
        this.serviceName, clampedVolume);
      hiTraceMeter.finishTrace(`${this.serviceName}_setVolume`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('setVolume', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_setVolume`, 0);
      return false;
    }
  }

  /**
   * @method selectCodec
   * @description Selects the audio codec to use for the A2DP connection.
   * The codec must be one of the supported codecs. Changing the codec during
   * active playback may cause a brief audio interruption.
   *
   * @param {number} codecId - The ID of the codec to select.
   * @returns {Promise<boolean>} A promise that resolves to true if the codec was selected successfully.
   */
  async selectCodec(codecId: number): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_selectCodec`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} select codec: ${codecId}`);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('selectCodec', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_selectCodec`, 0);
        return false;
      }

      const codec: A2dpAudioCodecInfo | undefined =
        this.supportedCodecs.find((c: A2dpAudioCodecInfo) => c.codecId === codecId);
      if (!codec) {
        this.addHistoryEntry('selectCodec', false, `Unsupported codec: ${codecId}`);
        hiTraceMeter.finishTrace(`${this.serviceName}_selectCodec`, 0);
        return false;
      }

      for (const c of this.supportedCodecs) {
        c.isActive = c.codecId === codecId;
      }

      this.model.codec = codecId;
      this.model.bitRate = codec.maxBitRate;
      this.codecSwitchCount++;

      if (this.qualityMetrics) {
        this.qualityMetrics.codecSwitchCount = this.codecSwitchCount;
        this.qualityMetrics.effectiveBitRate = codec.maxBitRate;
      }

      this.notifyDataCallbacks();
      this.addHistoryEntry('selectCodec', true, `Selected codec: ${codec.codecName}`);

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s codec selected: %{public}s',
        this.serviceName, codec.codecName);
      hiTraceMeter.finishTrace(`${this.serviceName}_selectCodec`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('selectCodec', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_selectCodec`, 0);
      return false;
    }
  }

  /**
   * @method getConnectionState
   * @description Returns the current A2DP connection state.
   * @returns {BluetoothConnectionState} The current connection state.
   */
  getConnectionState(): BluetoothConnectionState {
    return this.connectionState;
  }

  /**
   * @method getA2dpState
   * @description Returns the current A2DP-specific connection state.
   * @returns {A2dpConnectionState} The current A2DP state.
   */
  getA2dpState(): A2dpConnectionState {
    return this.a2dpState;
  }

  /**
   * @method getModel
   * @description Returns the current A2DP model containing audio state data.
   * @returns {A2dpModel} The current A2DP model.
   */
  getModel(): A2dpModel {
    return this.model;
  }

  /**
   * @method isConnected
   * @description Checks if there is an active A2DP connection.
   * @returns {boolean} True if connected, false otherwise.
   */
  isConnected(): boolean {
    return this.connectionState === BluetoothConnectionState.CONNECTED;
  }

  /**
   * @method isPlaying
   * @description Checks if audio is currently playing.
   * @returns {boolean} True if audio is playing, false otherwise.
   */
  isPlaying(): boolean {
    return this.model.isPlaying;
  }

  /**
   * @method getConnectedDeviceIds
   * @description Returns the list of currently connected device IDs.
   * @returns {string[]} Array of connected device IDs.
   */
  getConnectedDeviceIds(): string[] {
    return [...this.connectedDeviceIds];
  }

  /**
   * @method getSupportedCodecs
   * @description Returns the list of supported audio codecs.
   * @returns {A2dpAudioCodecInfo[]} Array of supported codec information.
   */
  getSupportedCodecs(): A2dpAudioCodecInfo[] {
    return [...this.supportedCodecs];
  }

  /**
   * @method getActiveCodec
   * @description Returns the currently active audio codec.
   * @returns {A2dpAudioCodecInfo | null} The active codec, or null if none is active.
   */
  getActiveCodec(): A2dpAudioCodecInfo | null {
    return this.supportedCodecs.find(c => c.isActive) || null;
  }

  /**
   * @method getPlaybackInfo
   * @description Returns the current playback information.
   * @returns {A2dpPlaybackInfo | null} The current playback info, or null if not available.
   */
  getPlaybackInfo(): A2dpPlaybackInfo | null {
    return this.playbackInfo ? { ...this.playbackInfo } : null;
  }

  /**
   * @method getQualityMetrics
   * @description Returns the current audio quality metrics.
   * @returns {A2dpQualityMetrics | null} The current quality metrics, or null if not available.
   */
  getQualityMetrics(): A2dpQualityMetrics | null {
    return this.qualityMetrics ? { ...this.qualityMetrics } : null;
  }

  /**
   * @method getStreamConfig
   * @description Returns the current stream configuration.
   * @returns {A2dpStreamConfig | null} The current stream config, or null if not configured.
   */
  getStreamConfig(): A2dpStreamConfig | null {
    return this.streamConfig ? { ...this.streamConfig } : null;
  }

  /**
   * @method getDeviceCapability
   * @description Returns the A2DP capabilities for a specific connected device.
   * @param {string} deviceId - The device identifier.
   * @returns {A2dpDeviceCapability | null} The device capability, or null if not found.
   */
  getDeviceCapability(deviceId: string): A2dpDeviceCapability | null {
    return this.deviceCapabilities.get(deviceId) || null;
  }

  /**
   * @method addConnectionCallback
   * @description Registers a callback for connection state changes.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback function.
   */
  addConnectionCallback(callback: (state: BluetoothConnectionState) => void): void {
    if (!this.connectionCallbacks.includes(callback)) {
      this.connectionCallbacks.push(callback);
    }
  }

  /**
   * @method removeConnectionCallback
   * @description Removes a previously registered connection state callback.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback to remove.
   */
  removeConnectionCallback(callback: (state: BluetoothConnectionState) => void): void {
    const index: number = this.connectionCallbacks.indexOf(callback);
    if (index !== -1) {
      this.connectionCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addDataCallback
   * @description Registers a callback for A2DP model data changes.
   * @param {(model: A2dpModel) => void} callback - The callback function.
   */
  addDataCallback(callback: (model: A2dpModel) => void): void {
    if (!this.dataCallbacks.includes(callback)) {
      this.dataCallbacks.push(callback);
    }
  }

  /**
   * @method removeDataCallback
   * @description Removes a previously registered data change callback.
   * @param {(model: A2dpModel) => void} callback - The callback to remove.
   */
  removeDataCallback(callback: (model: A2dpModel) => void): void {
    const index: number = this.dataCallbacks.indexOf(callback);
    if (index !== -1) {
      this.dataCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addPlaybackCallback
   * @description Registers a callback for playback state changes.
   * @param {(info: A2dpPlaybackInfo) => void} callback - The callback function.
   */
  addPlaybackCallback(callback: (info: A2dpPlaybackInfo) => void): void {
    if (!this.playbackCallbacks.includes(callback)) {
      this.playbackCallbacks.push(callback);
    }
  }

  /**
   * @method removePlaybackCallback
   * @description Removes a previously registered playback state callback.
   * @param {(info: A2dpPlaybackInfo) => void} callback - The callback to remove.
   */
  removePlaybackCallback(callback: (info: A2dpPlaybackInfo) => void): void {
    const index: number = this.playbackCallbacks.indexOf(callback);
    if (index !== -1) {
      this.playbackCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addQualityCallback
   * @description Registers a callback for quality metric updates.
   * @param {(metrics: A2dpQualityMetrics) => void} callback - The callback function.
   */
  addQualityCallback(callback: (metrics: A2dpQualityMetrics) => void): void {
    if (!this.qualityCallbacks.includes(callback)) {
      this.qualityCallbacks.push(callback);
    }
  }

  /**
   * @method removeQualityCallback
   * @description Removes a previously registered quality metric callback.
   * @param {(metrics: A2dpQualityMetrics) => void} callback - The callback to remove.
   */
  removeQualityCallback(callback: (metrics: A2dpQualityMetrics) => void): void {
    const index: number = this.qualityCallbacks.indexOf(callback);
    if (index !== -1) {
      this.qualityCallbacks.splice(index, 1);
    }
  }

  /**
   * @method getOperationHistory
   * @description Returns the history of operations performed by this service.
   * @returns {Array<{operation: string; timestamp: number; success: boolean; details: string}>}
   *          Array of operation history entries.
   */
  getOperationHistory(): Array<{ operation: string; timestamp: number; success: boolean; details: string }> {
    return [...this.operationHistory];
  }

  /**
   * @method getStatistics
   * @description Returns comprehensive statistics about the A2DP service operation.
   * @returns {object} Statistics object with connection, playback, and quality data.
   */
  getStatistics(): object {
    return {
      serviceName: this.serviceName,
      isInitialized: this.isInitialized,
      connectionState: this.connectionState,
      a2dpState: this.a2dpState,
      connectedDeviceCount: this.connectedDeviceIds.length,
      connectedDevices: [...this.connectedDeviceIds],
      isPlaying: this.model.isPlaying,
      currentVolume: this.model.volume,
      currentCodec: this.model.codec,
      activeCodec: this.getActiveCodec()?.codecName || 'None',
      supportedCodecCount: this.supportedCodecs.length,
      isStreamActive: this.isStreamActive,
      sessionDurationMs: this.sessionStartTime > 0 ? Date.now() - this.sessionStartTime : 0,
      totalBytesTransferred: this.totalBytesTransferred,
      codecSwitchCount: this.codecSwitchCount,
      operationHistoryCount: this.operationHistory.length,
      callbackCounts: {
        connection: this.connectionCallbacks.length,
        data: this.dataCallbacks.length,
        playback: this.playbackCallbacks.length,
        quality: this.qualityCallbacks.length
      }
    };
  }

  /**
   * @method reset
   * @description Resets the A2DP service to its initial state.
   * Disconnects all devices and clears all cached data.
   * @returns {Promise<void>}
   */
  async reset(): Promise<void> {
    hiTraceMeter.startTrace(`${this.serviceName}_reset`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} reset requested`);

    try {
      for (const deviceId of [...this.connectedDeviceIds]) {
        await this.disconnect(deviceId);
      }

      this.model = new A2dpModel();
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.a2dpState = A2dpConnectionState.NOT_CONNECTED;
      this.operationHistory = [];
      this.connectedDeviceIds = [];
      this.streamConfig = null;
      this.deviceCapabilities = new Map();
      this.qualityMetrics = null;
      this.playbackInfo = null;
      this.audioSourceDeviceId = '';
      this.isStreamActive = false;
      this.sessionStartTime = 0;
      this.totalBytesTransferred = 0;
      this.codecSwitchCount = 0;

      this.initializeQualityMetrics();
      this.initializePlaybackInfo();

      this.addHistoryEntry('reset', true, 'Service reset');
      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s reset complete', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_reset`, 0);
    } catch (error) {
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s reset failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_reset`, 0);
    }
  }

  /**
   * @method destroy
   * @description Destroys the A2DP service and releases all resources.
   * After calling this method, the service must be re-initialized before use.
   * @returns {Promise<void>}
   */
  async destroy(): Promise<void> {
    hiTraceMeter.startTrace(`${this.serviceName}_destroy`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} destroy requested`);

    try {
      await this.reset();

      this.connectionCallbacks = [];
      this.dataCallbacks = [];
      this.playbackCallbacks = [];
      this.qualityCallbacks = [];
      this.supportedCodecs = [];
      this.isInitialized = false;

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s destroyed', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_destroy`, 0);
    } catch (error) {
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s destroy failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_destroy`, 0);
    }
  }

  /**
   * @method notifyConnectionCallbacks
   * @description Notifies all registered connection state callbacks.
   * @private
   */
  private notifyConnectionCallbacks(): void {
    for (const callback of this.connectionCallbacks) {
      try {
        callback(this.connectionState);
      } catch (error) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyDataCallbacks
   * @description Notifies all registered data change callbacks.
   * @private
   */
  private notifyDataCallbacks(): void {
    for (const callback of this.dataCallbacks) {
      try {
        callback(this.model);
      } catch (error) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s data callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyPlaybackCallbacks
   * @description Notifies all registered playback state callbacks.
   * @private
   */
  private notifyPlaybackCallbacks(): void {
    if (!this.playbackInfo) {
      return;
    }
    for (const callback of this.playbackCallbacks) {
      try {
        callback(this.playbackInfo);
      } catch (error) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s playback callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method addHistoryEntry
   * @description Adds an entry to the operation history.
   * @param {string} operation - The operation name.
   * @param {boolean} success - Whether the operation succeeded.
   * @param {string} details - Additional details about the operation.
   * @private
   */
  private addHistoryEntry(operation: string, success: boolean, details: string): void {
    this.operationHistory.push({
      operation,
      timestamp: Date.now(),
      success,
      details
    });

    if (this.operationHistory.length > this.maxHistorySize) {
      this.operationHistory.shift();
    }
  }

  /**
   * @method simulateConnectionDelay
   * @description Simulates a network delay for connection operations.
   * @param {number} delayMs - The delay in milliseconds.
   * @returns {Promise<void>}
   * @private
   */
  private async simulateConnectionDelay(delayMs: number): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(resolve, delayMs);
    });
  }
}
