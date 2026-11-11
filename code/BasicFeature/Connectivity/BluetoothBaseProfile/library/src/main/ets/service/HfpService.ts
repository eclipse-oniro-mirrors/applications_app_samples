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
import { HfpModel, HfpJson } from '../model/HfpModel';
import { BluetoothConstants, BluetoothConnectionState, HfpConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';
import { Logger } from '../utils/basic/Logger';

/**
 * @interface HfpCallInfo
 * @description Comprehensive information about an active or recent call managed through
 * the Hands-Free Profile (HFP). This includes call state, participant details,
 * timing information, and audio routing configuration.
 */
export interface HfpCallInfo {
  /** Unique identifier for this call record */
  callId: string;
  /** Phone number of the remote party */
  phoneNumber: string;
  /** Contact name if available in phonebook */
  contactName: string;
  /** Current state of the call */
  callState: number;
  /** Call direction (incoming, outgoing, missed) */
  callDirection: string;
  /** Call start time in milliseconds since epoch */
  startTime: number;
  /** Call end time in milliseconds since epoch (0 if still active) */
  endTime: number;
  /** Call duration in seconds */
  durationSec: number;
  /** Whether this call is on hold */
  isOnHold: boolean;
  /** Whether this is a conference call */
  isConference: boolean;
  /** Number of participants in a conference call */
  participantCount: number;
  /** Call type (voice, video, VoIP) */
  callType: string;
  /** Network type used for the call (LTE, WiFi, etc.) */
  networkType: string;
  /** Whether HD voice is available for this call */
  hdVoiceEnabled: boolean;
  /** Whether echo cancellation is active */
  echoCancellation: boolean;
  /** Whether noise reduction is active */
  noiseReduction: boolean;
}

/**
 * @interface HfpNetworkInfo
 * @description Information about the cellular network status as reported through HFP.
 * Used to display network indicators and manage call quality expectations.
 */
export interface HfpNetworkInfo {
  /** Current network registration status */
  registrationStatus: number;
  /** Name of the cellular carrier */
  carrierName: string;
  /** Signal strength in dBm (negative value, closer to 0 is better) */
  signalStrength: number;
  /** Network type (2G, 3G, 4G, 5G) */
  networkType: string;
  /** Whether roaming is active */
  isRoaming: boolean;
  /** Whether VoLTE is available */
  volteAvailable: boolean;
  /** Current cell ID */
  cellId: string;
  /** Location area code */
  locationAreaCode: string;
  /** Mobile country code */
  mcc: string;
  /** Mobile network code */
  mnc: string;
}

/**
 * @interface HfpAudioConfig
 * @description Audio configuration for the HFP connection. Controls microphone,
 * speaker, and codec settings for voice calls.
 */
export interface HfpAudioConfig {
  /** Microphone volume level (0-100) */
  micVolume: number;
  /** Speaker volume level (0-100) */
  speakerVolume: number;
  /** Whether microphone is muted */
  isMuted: boolean;
  /** Whether speaker mode is active */
  isSpeakerOn: boolean;
  /** Whether echo cancellation is enabled */
  echoCancellation: boolean;
  /** Whether noise suppression is enabled */
  noiseSuppression: boolean;
  /** Audio codec for voice calls (CVSD, mSBC, etc.) */
  voiceCodec: string;
  /** Sampling rate for voice audio */
  sampleRate: number;
  /** Whether wideband speech is supported */
  widebandSpeech: boolean;
  /** Audio routing mode (earpiece, speaker, bluetooth) */
  audioRouting: string;
}

/**
 * @interface HfpBatteryInfo
 * @description Battery information for the HFP device. Used to display battery
 * status and warn about low battery conditions.
 */
export interface HfpBatteryInfo {
  /** Battery level as a percentage (0-100) */
  level: number;
  /** Whether the device is currently charging */
  isCharging: boolean;
  /** Estimated remaining time in minutes */
  estimatedTimeMinutes: number;
  /** Battery health status (good, degraded, poor) */
  healthStatus: string;
  /** Battery temperature in degrees Celsius */
  temperature: number;
  /** Battery voltage in millivolts */
  voltage: number;
  /** Number of charge cycles */
  chargeCycles: number;
}

/**
 * @interface HfpDialCommand
 * @description Represents a voice dialing command received through HFP.
 * Supports various dialing modes including last number redial,
 * voice tagging, and memory dialing.
 */
export interface HfpDialCommand {
  /** The phone number to dial */
  phoneNumber: string;
  /** Memory location for speed dial */
  memoryLocation: number;
  /** Voice tag to dial */
  voiceTag: string;
  /** Whether to redial the last number */
  redialLast: boolean;
  /** Whether this is an emergency call */
  isEmergency: boolean;
}

/**
 * @class HfpService
 * @description Service class for managing the Bluetooth HFP (Hands-Free Profile).
 * HFP enables a Bluetooth device to act as a hands-free kit for a mobile phone,
 * allowing the user to make and receive calls, adjust volume, and manage audio
 * routing through the hands-free device.
 *
 * <p>This service provides comprehensive functionality including:</p>
 * <ul>
 *   <li>Call management (answer, reject, hold, terminate, merge)</li>
 *   <li>Audio routing and volume control</li>
 *   <li>Phonebook access and caller ID display</li>
 *   <li>Voice dialing support</li>
 *   <li>Network status monitoring</li>
 *   <li>Battery level reporting</li>
 *   <li>HD voice and wideband speech support</li>
 *   <li>Connection state change notifications</li>
 *   <li>Operation history tracking</li>
 *   <li>Performance tracing via hiTraceMeter</li>
 * </ul>
 *
 * <p>The HFP service follows the standard lifecycle pattern:</p>
 * <ol>
 *   <li>Create an instance of HfpService</li>
 *   <li>Call initialize() to set up the service</li>
 *   <li>Connect to a phone device for hands-free operation</li>
 *   <li>Use call management methods during active connections</li>
 *   <li>Call destroy() when the service is no longer needed</li>
 * </ol>
 *
 * @example
 * ```typescript
 * const hfpService = new HfpService();
 * await hfpService.initialize();
 * await hfpService.connect('device-id');
 * await hfpService.answerCall();
 * await hfpService.setSpeakerVolume(75);
 * ```
 *
 * @since 26.0.0
 */
export class HfpService {
  /** Service name identifier for logging and tracing */
  private readonly serviceName: string = 'HfpService';

  /** Current HFP model containing call state data */
  private model: HfpModel = new HfpModel();

  /** Whether the service has been initialized */
  private isInitialized: boolean = false;

  /** Current connection state */
  private connectionState: BluetoothConnectionState = BluetoothConnectionState.DISCONNECTED;

  /** Current HFP-specific connection state */
  private hfpState: HfpConnectionState = HfpConnectionState.NOT_CONNECTED;

  /** List of registered connection state change callbacks */
  private connectionCallbacks: Array<(state: BluetoothConnectionState) => void> = [];

  /** List of registered data change callbacks */
  private dataCallbacks: Array<(model: HfpModel) => void> = [];

  /** List of registered call state callbacks */
  private callCallbacks: Array<(callInfo: HfpCallInfo) => void> = [];

  /** List of registered audio config callbacks */
  private audioCallbacks: Array<(config: HfpAudioConfig) => void> = [];

  /** History of operations performed by this service */
  private operationHistory: Array<{ operation: string; timestamp: number; success: boolean; details: string }> = [];

  /** Maximum number of operations to retain in history */
  private maxHistorySize: number = 200;

  /** Connected device IDs */
  private connectedDeviceIds: string[] = [];

  /** Current call information */
  private currentCall: HfpCallInfo | null = null;

  /** Call history records */
  private callHistory: HfpCallInfo[] = [];

  /** Network information */
  private networkInfo: HfpNetworkInfo | null = null;

  /** Audio configuration */
  private audioConfig: HfpAudioConfig | null = null;

  /** Battery information */
  private batteryInfo: HfpBatteryInfo | null = null;

  /** Whether voice recognition is active */
  private voiceRecognitionActive: boolean = false;

  /** Maximum number of simultaneous calls supported */
  private maxSimultaneousCalls: number = 2;

  /** Active call count */
  private activeCallCount: number = 0;

  /** Whether in-band ringing is enabled */
  private inBandRinging: boolean = true;

  /** Whether three-way calling is supported */
  private threeWayCalling: boolean = true;

  /**
   * @method initialize
   * @description Initializes the HFP service and prepares it for hands-free operation.
   * Must be called before any other service methods.
   *
   * @returns {Promise<boolean>} True if initialization was successful.
   */
  async initialize(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_initialize`, 0);
    Logger.info(BluetoothConstants.TAG, `Initializing ${this.serviceName}`);

    try {
      if (this.isInitialized) {
        hilog.warn(0xF830, BluetoothConstants.TAG, '%{public}s already initialized', this.serviceName);
        this.addHistoryEntry('initialize', false, 'Already initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
        return false;
      }

      this.model = new HfpModel();
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.hfpState = HfpConnectionState.NOT_CONNECTED;
      this.operationHistory = [];
      this.connectedDeviceIds = [];
      this.currentCall = null;
      this.callHistory = [];
      this.networkInfo = null;
      this.audioConfig = null;
      this.batteryInfo = null;
      this.voiceRecognitionActive = false;
      this.activeCallCount = 0;
      this.inBandRinging = true;
      this.threeWayCalling = true;

      this.initializeDefaultAudioConfig();
      this.initializeDefaultNetworkInfo();
      this.initializeDefaultBatteryInfo();

      this.isInitialized = true;
      this.addHistoryEntry('initialize', true, 'Service initialized successfully');

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s initialized successfully', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
      return true;
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s initialization failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      this.addHistoryEntry('initialize', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
      return false;
    }
  }

  /**
   * @method initializeDefaultAudioConfig
   * @description Sets up the default audio configuration for HFP calls.
   * @private
   */
  private initializeDefaultAudioConfig(): void {
    this.audioConfig = {
      micVolume: 50,
      speakerVolume: 50,
      isMuted: false,
      isSpeakerOn: false,
      echoCancellation: true,
      noiseSuppression: true,
      voiceCodec: 'CVSD',
      sampleRate: 8000,
      widebandSpeech: false,
      audioRouting: 'bluetooth'
    };
  }

  /**
   * @method initializeDefaultNetworkInfo
   * @description Sets up default network information placeholder.
   * @private
   */
  private initializeDefaultNetworkInfo(): void {
    this.networkInfo = {
      registrationStatus: 1,
      carrierName: 'Mock Carrier',
      signalStrength: -65,
      networkType: '4G',
      isRoaming: false,
      volteAvailable: true,
      cellId: '0x1234',
      locationAreaCode: '0x0001',
      mcc: '310',
      mnc: '260'
    };
  }

  /**
   * @method initializeDefaultBatteryInfo
   * @description Sets up default battery information for the connected device.
   * @private
   */
  private initializeDefaultBatteryInfo(): void {
    this.batteryInfo = {
      level: 85,
      isCharging: false,
      estimatedTimeMinutes: 480,
      healthStatus: 'good',
      temperature: 25,
      voltage: 3800,
      chargeCycles: 150
    };
  }

  /**
   * @method connect
   * @description Establishes an HFP connection with the specified Bluetooth device.
   *
   * @param {string} deviceId - The unique identifier of the device to connect to.
   * @returns {Promise<boolean>} True if the connection was successfully established.
   */
  async connect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_connect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} connecting to device: ${deviceId}`);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('connect', false, 'Service not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return false;
      }

      if (!deviceId || deviceId.length === 0) {
        this.addHistoryEntry('connect', false, 'Invalid device ID');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return false;
      }

      if (this.connectedDeviceIds.includes(deviceId)) {
        this.addHistoryEntry('connect', false, 'Already connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return true;
      }

      this.connectionState = BluetoothConnectionState.CONNECTING;
      this.hfpState = HfpConnectionState.SLC_CONNECTING;
      this.notifyConnectionCallbacks();

      await this.simulateDelay(600);

      this.connectedDeviceIds.push(deviceId);
      this.connectionState = BluetoothConnectionState.CONNECTED;
      this.hfpState = HfpConnectionState.SLC_CONNECTED;
      this.model.updateConnectionState(BluetoothConnectionState.CONNECTED);

      this.notifyConnectionCallbacks();
      this.notifyDataCallbacks();
      this.addHistoryEntry('connect', true, `Connected to ${deviceId}`);

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s connected to %{public}s', this.serviceName, deviceId);
      hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
      return true;
    } catch (error) {
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.hfpState = HfpConnectionState.NOT_CONNECTED;
      this.addHistoryEntry('connect', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
      return false;
    }
  }

  /**
   * @method disconnect
   * @description Disconnects the HFP connection from the specified device.
   *
   * @param {string} deviceId - The device identifier to disconnect.
   * @returns {Promise<boolean>} True if disconnection was successful.
   */
  async disconnect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_disconnect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} disconnecting from: ${deviceId}`);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('disconnect', false, 'Not initialized');
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
      this.hfpState = HfpConnectionState.DISCONNECTING;
      this.notifyConnectionCallbacks();

      await this.simulateDelay(300);

      this.connectedDeviceIds.splice(index, 1);

      if (this.connectedDeviceIds.length === 0) {
        this.connectionState = BluetoothConnectionState.DISCONNECTED;
        this.hfpState = HfpConnectionState.NOT_CONNECTED;
        this.model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
        this.model.reset();
      } else {
        this.connectionState = BluetoothConnectionState.CONNECTED;
        this.hfpState = HfpConnectionState.SLC_CONNECTED;
      }

      this.notifyConnectionCallbacks();
      this.notifyDataCallbacks();
      this.addHistoryEntry('disconnect', true, `Disconnected from ${deviceId}`);

      hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('disconnect', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
      return false;
    }
  }

  /**
   * @method answerCall
   * @description Answers an incoming call on the connected device.
   * Sends the AT+BLEA command to accept the incoming call.
   *
   * @returns {Promise<boolean>} True if the call was answered successfully.
   */
  async answerCall(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_answerCall`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} answer call requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('answerCall', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_answerCall`, 0);
        return false;
      }

      this.model.callState = 1; // Active call
      if (this.currentCall) {
        this.currentCall.callState = 1;
        this.currentCall.startTime = Date.now();
      }
      this.activeCallCount++;

      this.notifyDataCallbacks();
      this.notifyCallCallbacks();
      this.addHistoryEntry('answerCall', true, 'Call answered');

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s call answered', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_answerCall`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('answerCall', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_answerCall`, 0);
      return false;
    }
  }

  /**
   * @method rejectCall
   * @description Rejects an incoming call on the connected device.
   * Sends the AT+CHUP command to reject the call.
   *
   * @returns {Promise<boolean>} True if the call was rejected successfully.
   */
  async rejectCall(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_rejectCall`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} reject call requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('rejectCall', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_rejectCall`, 0);
        return false;
      }

      if (this.currentCall) {
        this.currentCall.callState = 6; // Rejected
        this.currentCall.endTime = Date.now();
        this.callHistory.push({ ...this.currentCall });
      }

      this.model.callState = 0; // No call
      this.model.phoneNumber = '';
      this.currentCall = null;
      this.activeCallCount = Math.max(0, this.activeCallCount - 1);

      this.notifyDataCallbacks();
      this.notifyCallCallbacks();
      this.addHistoryEntry('rejectCall', true, 'Call rejected');

      hiTraceMeter.finishTrace(`${this.serviceName}_rejectCall`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('rejectCall', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_rejectCall`, 0);
      return false;
    }
  }

  /**
   * @method endCall
   * @description Terminates the current active call.
   * Sends the AT+CHUP command to hang up.
   *
   * @returns {Promise<boolean>} True if the call was ended successfully.
   */
  async endCall(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_endCall`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} end call requested`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('endCall', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_endCall`, 0);
        return false;
      }

      if (this.currentCall) {
        this.currentCall.callState = 4; // Ended
        this.currentCall.endTime = Date.now();
        this.currentCall.durationSec = Math.floor((this.currentCall.endTime - this.currentCall.startTime) / 1000);
        this.callHistory.push({ ...this.currentCall });
      }

      this.model.callState = 0;
      this.model.phoneNumber = '';
      this.model.callDuration = 0;
      this.currentCall = null;
      this.activeCallCount = Math.max(0, this.activeCallCount - 1);

      this.notifyDataCallbacks();
      this.notifyCallCallbacks();
      this.addHistoryEntry('endCall', true, 'Call ended');

      hiTraceMeter.finishTrace(`${this.serviceName}_endCall`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('endCall', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_endCall`, 0);
      return false;
    }
  }

  /**
   * @method holdCall
   * @description Puts the current active call on hold.
   * Sends the AT+CHLD=2 command to hold the active call.
   *
   * @returns {Promise<boolean>} True if the call was put on hold successfully.
   */
  async holdCall(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_holdCall`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} hold call requested`);

    try {
      if (!this.isInitialized || !this.currentCall) {
        this.addHistoryEntry('holdCall', false, 'No active call');
        hiTraceMeter.finishTrace(`${this.serviceName}_holdCall`, 0);
        return false;
      }

      this.currentCall.isOnHold = true;
      this.model.callState = 3; // On hold

      this.notifyDataCallbacks();
      this.notifyCallCallbacks();
      this.addHistoryEntry('holdCall', true, 'Call on hold');

      hiTraceMeter.finishTrace(`${this.serviceName}_holdCall`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('holdCall', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_holdCall`, 0);
      return false;
    }
  }

  /**
   * @method resumeCall
   * @description Resumes a held call.
   * Sends the AT+CHLD=2 command to resume the held call.
   *
   * @returns {Promise<boolean>} True if the call was resumed successfully.
   */
  async resumeCall(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_resumeCall`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} resume call requested`);

    try {
      if (!this.isInitialized || !this.currentCall || !this.currentCall.isOnHold) {
        this.addHistoryEntry('resumeCall', false, 'No held call');
        hiTraceMeter.finishTrace(`${this.serviceName}_resumeCall`, 0);
        return false;
      }

      this.currentCall.isOnHold = false;
      this.model.callState = 1; // Active

      this.notifyDataCallbacks();
      this.notifyCallCallbacks();
      this.addHistoryEntry('resumeCall', true, 'Call resumed');

      hiTraceMeter.finishTrace(`${this.serviceName}_resumeCall`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('resumeCall', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_resumeCall`, 0);
      return false;
    }
  }

  /**
   * @method dialNumber
   * @description Initiates an outgoing call to the specified phone number.
   * Sends the ATD command with the phone number.
   *
   * @param {string} phoneNumber - The phone number to dial.
   * @returns {Promise<boolean>} True if the call was initiated successfully.
   */
  async dialNumber(phoneNumber: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_dialNumber`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} dialing: ${phoneNumber}`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('dialNumber', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_dialNumber`, 0);
        return false;
      }

      if (!phoneNumber || phoneNumber.length === 0) {
        this.addHistoryEntry('dialNumber', false, 'Empty phone number');
        hiTraceMeter.finishTrace(`${this.serviceName}_dialNumber`, 0);
        return false;
      }

      this.model.callState = 2; // Dialing
      this.model.phoneNumber = phoneNumber;

      this.currentCall = {
        callId: `call_${Date.now()}`,
        phoneNumber: phoneNumber,
        contactName: '',
        callState: 2,
        callDirection: 'outgoing',
        startTime: Date.now(),
        endTime: 0,
        durationSec: 0,
        isOnHold: false,
        isConference: false,
        participantCount: 1,
        callType: 'voice',
        networkType: this.networkInfo?.networkType || '4G',
        hdVoiceEnabled: this.audioConfig?.widebandSpeech || false,
        echoCancellation: this.audioConfig?.echoCancellation || false,
        noiseReduction: this.audioConfig?.noiseSuppression || false
      };

      this.activeCallCount++;
      this.notifyDataCallbacks();
      this.notifyCallCallbacks();
      this.addHistoryEntry('dialNumber', true, `Dialing ${phoneNumber}`);

      hiTraceMeter.finishTrace(`${this.serviceName}_dialNumber`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('dialNumber', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_dialNumber`, 0);
      return false;
    }
  }

  /**
   * @method redialLastNumber
   * @description Redials the last dialed phone number.
   * Sends the AT+BLDN command.
   *
   * @returns {Promise<boolean>} True if redial was initiated successfully.
   */
  async redialLastNumber(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_redial`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} redial last number`);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('redial', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_redial`, 0);
        return false;
      }

      const lastCall: HfpCallInfo | null = this.callHistory.length > 0 ? this.callHistory[this.callHistory.length - 1] : null;
      if (lastCall) {
        await this.dialNumber(lastCall.phoneNumber);
        this.addHistoryEntry('redial', true, `Redialing ${lastCall.phoneNumber}`);
      } else {
        this.addHistoryEntry('redial', false, 'No previous call to redial');
      }

      hiTraceMeter.finishTrace(`${this.serviceName}_redial`, 0);
      return lastCall !== null;
    } catch (error) {
      this.addHistoryEntry('redial', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_redial`, 0);
      return false;
    }
  }

  /**
   * @method setMicVolume
   * @description Sets the microphone volume level for the HFP connection.
   *
   * @param {number} volume - Volume level from 0 (mute) to 100 (maximum).
   * @returns {Promise<boolean>} True if the volume was set successfully.
   */
  async setMicVolume(volume: number): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_setMicVolume`, 0);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('setMicVolume', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_setMicVolume`, 0);
        return false;
      }

      const clamped: number = Math.max(0, Math.min(100, Math.round(volume)));
      this.model.micVolume = clamped;
      if (this.audioConfig) {
        this.audioConfig.micVolume = clamped;
      }

      this.notifyDataCallbacks();
      this.addHistoryEntry('setMicVolume', true, `Mic volume: ${clamped}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_setMicVolume`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('setMicVolume', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_setMicVolume`, 0);
      return false;
    }
  }

  /**
   * @method setSpeakerVolume
   * @description Sets the speaker volume level for the HFP connection.
   *
   * @param {number} volume - Volume level from 0 (mute) to 100 (maximum).
   * @returns {Promise<boolean>} True if the volume was set successfully.
   */
  async setSpeakerVolume(volume: number): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_setSpeakerVolume`, 0);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('setSpeakerVolume', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_setSpeakerVolume`, 0);
        return false;
      }

      const clamped: number = Math.max(0, Math.min(100, Math.round(volume)));
      this.model.speakerVolume = clamped;
      if (this.audioConfig) {
        this.audioConfig.speakerVolume = clamped;
      }

      this.notifyDataCallbacks();
      this.addHistoryEntry('setSpeakerVolume', true, `Speaker volume: ${clamped}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_setSpeakerVolume`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('setSpeakerVolume', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_setSpeakerVolume`, 0);
      return false;
    }
  }

  /**
   * @method toggleMute
   * @description Toggles the microphone mute state.
   *
   * @returns {Promise<boolean>} True if the mute state was toggled successfully.
   */
  async toggleMute(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_toggleMute`, 0);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('toggleMute', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_toggleMute`, 0);
        return false;
      }

      this.model.isMuted = !this.model.isMuted;
      if (this.audioConfig) {
        this.audioConfig.isMuted = this.model.isMuted;
      }

      this.notifyDataCallbacks();
      this.addHistoryEntry('toggleMute', true, `Muted: ${this.model.isMuted}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_toggleMute`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('toggleMute', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_toggleMute`, 0);
      return false;
    }
  }

  /**
   * @method toggleSpeaker
   * @description Toggles the speaker mode (earpiece vs speakerphone).
   *
   * @returns {Promise<boolean>} True if the speaker state was toggled successfully.
   */
  async toggleSpeaker(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_toggleSpeaker`, 0);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('toggleSpeaker', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_toggleSpeaker`, 0);
        return false;
      }

      this.model.isSpeakerOn = !this.model.isSpeakerOn;
      if (this.audioConfig) {
        this.audioConfig.isSpeakerOn = this.model.isSpeakerOn;
        this.audioConfig.audioRouting = this.model.isSpeakerOn ? 'speaker' : 'bluetooth';
      }

      this.notifyDataCallbacks();
      this.notifyAudioCallbacks();
      this.addHistoryEntry('toggleSpeaker', true, `Speaker: ${this.model.isSpeakerOn}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_toggleSpeaker`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('toggleSpeaker', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_toggleSpeaker`, 0);
      return false;
    }
  }

  /**
   * @method startVoiceRecognition
   * @description Activates voice recognition on the connected phone.
   * Sends the AT+BVRA=1 command.
   *
   * @returns {Promise<boolean>} True if voice recognition was started.
   */
  async startVoiceRecognition(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_startVR`, 0);

    try {
      if (!this.isInitialized || this.connectedDeviceIds.length === 0) {
        this.addHistoryEntry('startVoiceRecognition', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_startVR`, 0);
        return false;
      }

      this.voiceRecognitionActive = true;
      this.addHistoryEntry('startVoiceRecognition', true, 'Voice recognition started');
      hiTraceMeter.finishTrace(`${this.serviceName}_startVR`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('startVoiceRecognition', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_startVR`, 0);
      return false;
    }
  }

  /**
   * @method stopVoiceRecognition
   * @description Deactivates voice recognition on the connected phone.
   * Sends the AT+BVRA=0 command.
   *
   * @returns {Promise<boolean>} True if voice recognition was stopped.
   */
  async stopVoiceRecognition(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_stopVR`, 0);

    try {
      this.voiceRecognitionActive = false;
      this.addHistoryEntry('stopVoiceRecognition', true, 'Voice recognition stopped');
      hiTraceMeter.finishTrace(`${this.serviceName}_stopVR`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('stopVoiceRecognition', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_stopVR`, 0);
      return false;
    }
  }

  /**
   * @method getConnectionState
   * @description Returns the current HFP connection state.
   * @returns {BluetoothConnectionState} The current connection state.
   */
  getConnectionState(): BluetoothConnectionState {
    return this.connectionState;
  }

  /**
   * @method getHfpState
   * @description Returns the current HFP-specific state.
   * @returns {HfpConnectionState} The HFP state.
   */
  getHfpState(): HfpConnectionState {
    return this.hfpState;
  }

  /**
   * @method getModel
   * @description Returns the current HFP model.
   * @returns {HfpModel} The HFP model.
   */
  getModel(): HfpModel {
    return this.model;
  }

  /**
   * @method isConnected
   * @description Checks if the service is connected.
   * @returns {boolean} True if connected.
   */
  isConnected(): boolean {
    return this.connectionState === BluetoothConnectionState.CONNECTED;
  }

  /**
   * @method getCurrentCall
   * @description Returns information about the current active call.
   * @returns {HfpCallInfo | null} Current call info or null if no active call.
   */
  getCurrentCall(): HfpCallInfo | null {
    return this.currentCall ? { ...this.currentCall } : null;
  }

  /**
   * @method getCallHistory
   * @description Returns the call history.
   * @returns {HfpCallInfo[]} Array of past call records.
   */
  getCallHistory(): HfpCallInfo[] {
    return [...this.callHistory];
  }

  /**
   * @method getNetworkInfo
   * @description Returns the current network information.
   * @returns {HfpNetworkInfo | null} Network info or null if not available.
   */
  getNetworkInfo(): HfpNetworkInfo | null {
    return this.networkInfo ? { ...this.networkInfo } : null;
  }

  /**
   * @method getAudioConfig
   * @description Returns the current audio configuration.
   * @returns {HfpAudioConfig | null} Audio config or null if not available.
   */
  getAudioConfig(): HfpAudioConfig | null {
    return this.audioConfig ? { ...this.audioConfig } : null;
  }

  /**
   * @method getBatteryInfo
   * @description Returns the battery information.
   * @returns {HfpBatteryInfo | null} Battery info or null if not available.
   */
  getBatteryInfo(): HfpBatteryInfo | null {
    return this.batteryInfo ? { ...this.batteryInfo } : null;
  }

  /**
   * @method getActiveCallCount
   * @description Returns the number of active calls.
   * @returns {number} Active call count.
   */
  getActiveCallCount(): number {
    return this.activeCallCount;
  }

  /**
   * @method isVoiceRecognitionActive
   * @description Checks if voice recognition is currently active.
   * @returns {boolean} True if voice recognition is active.
   */
  isVoiceRecognitionActive(): boolean {
    return this.voiceRecognitionActive;
  }

  /**
   * @method addConnectionCallback
   * @description Registers a connection state change callback.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback function.
   */
  addConnectionCallback(callback: (state: BluetoothConnectionState) => void): void {
    if (!this.connectionCallbacks.includes(callback)) {
      this.connectionCallbacks.push(callback);
    }
  }

  /**
   * @method removeConnectionCallback
   * @description Removes a connection state change callback.
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
   * @description Registers a data change callback.
   * @param {(model: HfpModel) => void} callback - The callback function.
   */
  addDataCallback(callback: (model: HfpModel) => void): void {
    if (!this.dataCallbacks.includes(callback)) {
      this.dataCallbacks.push(callback);
    }
  }

  /**
   * @method removeDataCallback
   * @description Removes a data change callback.
   * @param {(model: HfpModel) => void} callback - The callback to remove.
   */
  removeDataCallback(callback: (model: HfpModel) => void): void {
    const index: number = this.dataCallbacks.indexOf(callback);
    if (index !== -1) {
      this.dataCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addCallCallback
   * @description Registers a call state change callback.
   * @param {(callInfo: HfpCallInfo) => void} callback - The callback function.
   */
  addCallCallback(callback: (callInfo: HfpCallInfo) => void): void {
    if (!this.callCallbacks.includes(callback)) {
      this.callCallbacks.push(callback);
    }
  }

  /**
   * @method removeCallCallback
   * @description Removes a call state change callback.
   * @param {(callInfo: HfpCallInfo) => void} callback - The callback to remove.
   */
  removeCallCallback(callback: (callInfo: HfpCallInfo) => void): void {
    const index: number = this.callCallbacks.indexOf(callback);
    if (index !== -1) {
      this.callCallbacks.splice(index, 1);
    }
  }

  /**
   * @method getOperationHistory
   * @description Returns the operation history.
   * @returns {Array<{operation: string; timestamp: number; success: boolean; details: string}>}
   */
  getOperationHistory(): Array<{ operation: string; timestamp: number; success: boolean; details: string }> {
    return [...this.operationHistory];
  }

  /**
   * @method getStatistics
   * @description Returns comprehensive service statistics.
   * @returns {object} Statistics object.
   */
  getStatistics(): object {
    return {
      serviceName: this.serviceName,
      isInitialized: this.isInitialized,
      connectionState: this.connectionState,
      hfpState: this.hfpState,
      connectedDeviceCount: this.connectedDeviceIds.length,
      activeCallCount: this.activeCallCount,
      totalCallsInHistory: this.callHistory.length,
      voiceRecognitionActive: this.voiceRecognitionActive,
      inBandRinging: this.inBandRinging,
      threeWayCalling: this.threeWayCalling,
      operationHistoryCount: this.operationHistory.length,
      callbackCounts: {
        connection: this.connectionCallbacks.length,
        data: this.dataCallbacks.length,
        call: this.callCallbacks.length,
        audio: this.audioCallbacks.length
      }
    };
  }

  /**
   * @method reset
   * @description Resets the service to its initial state.
   * @returns {Promise<void>}
   */
  async reset(): Promise<void> {
    hiTraceMeter.startTrace(`${this.serviceName}_reset`, 0);

    try {
      for (const deviceId of [...this.connectedDeviceIds]) {
        await this.disconnect(deviceId);
      }

      this.model = new HfpModel();
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.hfpState = HfpConnectionState.NOT_CONNECTED;
      this.operationHistory = [];
      this.connectedDeviceIds = [];
      this.currentCall = null;
      this.callHistory = [];
      this.activeCallCount = 0;
      this.voiceRecognitionActive = false;

      this.initializeDefaultAudioConfig();
      this.initializeDefaultNetworkInfo();
      this.initializeDefaultBatteryInfo();

      this.addHistoryEntry('reset', true, 'Service reset');
      hiTraceMeter.finishTrace(`${this.serviceName}_reset`, 0);
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s reset failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_reset`, 0);
    }
  }

  /**
   * @method destroy
   * @description Destroys the service and releases all resources.
   * @returns {Promise<void>}
   */
  async destroy(): Promise<void> {
    hiTraceMeter.startTrace(`${this.serviceName}_destroy`, 0);

    try {
      await this.reset();
      this.connectionCallbacks = [];
      this.dataCallbacks = [];
      this.callCallbacks = [];
      this.audioCallbacks = [];
      this.isInitialized = false;

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s destroyed', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_destroy`, 0);
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s destroy failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_destroy`, 0);
    }
  }

  /**
   * @method notifyConnectionCallbacks
   * @private
   */
  private notifyConnectionCallbacks(): void {
    for (const callback of this.connectionCallbacks) {
      try {
        callback(this.connectionState);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyDataCallbacks
   * @private
   */
  private notifyDataCallbacks(): void {
    for (const callback of this.dataCallbacks) {
      try {
        callback(this.model);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s data callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyCallCallbacks
   * @private
   */
  private notifyCallCallbacks(): void {
    if (!this.currentCall) {
      return;
    }
    for (const callback of this.callCallbacks) {
      try {
        callback(this.currentCall);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s call callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyAudioCallbacks
   * @private
   */
  private notifyAudioCallbacks(): void {
    if (!this.audioConfig) {
      return;
    }
    for (const callback of this.audioCallbacks) {
      try {
        callback(this.audioConfig);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s audio callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method addHistoryEntry
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
   * @method simulateDelay
   * @private
   */
  private async simulateDelay(delayMs: number): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(resolve, delayMs);
    });
  }
}
