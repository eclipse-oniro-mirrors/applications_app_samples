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

/**
 * @file BluetoothConstants.ts
 * @description Bluetooth BaseProfile sample project constants and enumerations.
 * This file defines all constants, enumerations, and type definitions used
 * throughout the Bluetooth BaseProfile sample application. It includes
 * definitions for all supported Bluetooth profiles, connection states,
 * scan states, and profile-specific enumerations.
 *
 * The constants are organized into the following categories:
 * 1. Global constants (logging, error codes, limits)
 * 2. Profile type enumerations
 * 3. Connection state enumerations
 * 4. Profile-specific state enumerations
 * 5. Device type and role enumerations
 *
 * @module BluetoothConstants
 * @version 1.0.0
 * @since API 12
 */

/**
 * Global Bluetooth constants class.
 * Contains all constant values used across the Bluetooth BaseProfile sample.
 * These include logging configuration, error codes, operational limits,
 * and timing parameters.
 *
 * Usage:
 * ```typescript
 * import { BluetoothConstants } from '../constants/BluetoothConstants';
 * const tag = BluetoothConstants.TAG;
 * ```
 */
export class BluetoothConstants {
  // ========================================
  // Logging Constants
  // ========================================

  /** Log tag for all Bluetooth BaseProfile sample logging */
  static readonly TAG: string = '[Sample_BluetoothBaseProfile]';

  /** Log domain identifier for hilog output (0xF830 = Connectivity sample) */
  static readonly DOMAIN: number = 0xF830;

  /** Application bundle name for identification */
  static readonly BUNDLE_NAME: string = 'com.samples.bluetoothbaseprofile';

  /** hiTraceMeter trace domain for performance analysis */
  static readonly TRACE_DOMAIN: number = 0xF830;

  /** hiAppEvent event domain for application event reporting */
  static readonly EVENT_DOMAIN: number = 0xF830;

  /** hiAppEvent event group name for Bluetooth events */
  static readonly EVENT_GROUP: string = 'bluetoothBaseProfileEvent';

  // ========================================
  // Error Code Constants
  // ========================================

  /** Error code: Permission denied by the system */
  static readonly ERROR_PERMISSION_DENIED: number = 201;

  /** Error code: Internal system error occurred */
  static readonly ERROR_INTERNAL: number = 35200001;

  /** Error code: Bluetooth adapter is disabled or not available */
  static readonly ERROR_BLUETOOTH_DISABLED: number = 35200002;

  /** Error code: Target Bluetooth device was not found */
  static readonly ERROR_DEVICE_NOT_FOUND: number = 35200003;

  /** Error code: Connection attempt timed out */
  static readonly ERROR_CONNECTION_TIMEOUT: number = 35200004;

  /** Error code: Requested Bluetooth profile is not supported */
  static readonly ERROR_PROFILE_NOT_SUPPORTED: number = 35200005;

  /** Error code: Device is already connected */
  static readonly ERROR_ALREADY_CONNECTED: number = 35200006;

  /** Error code: Device is not paired */
  static readonly ERROR_NOT_PAIRED: number = 35200007;

  /** Error code: Service discovery failed */
  static readonly ERROR_SERVICE_DISCOVERY_FAILED: number = 35200008;

  /** Error code: Authentication failed */
  static readonly ERROR_AUTHENTICATION_FAILED: number = 35200009;

  /** Error code: Resource unavailable */
  static readonly ERROR_RESOURCE_UNAVAILABLE: number = 35200010;

  // ========================================
  // Operational Limits
  // ========================================

  /** Maximum number of log entries to retain in memory */
  static readonly MAX_LOG_ENTRIES: number = 200;

  /** Maximum number of connection retry attempts */
  static readonly MAX_RETRY_COUNT: number = 3;

  /** Default operation timeout in milliseconds */
  static readonly OPERATION_TIMEOUT_MS: number = 10000;

  /** Status refresh interval in milliseconds */
  static readonly REFRESH_INTERVAL_MS: number = 5000;

  /** Bluetooth device scan timeout in milliseconds */
  static readonly SCAN_TIMEOUT_MS: number = 30000;

  /** Maximum number of simultaneously connected devices */
  static readonly MAX_CONNECTED_DEVICES: number = 7;

  /** Maximum number of devices to display in scan results */
  static readonly MAX_SCAN_DEVICES: number = 50;

  /** Maximum length of a Bluetooth device name */
  static readonly MAX_DEVICE_NAME_LENGTH: number = 248;

  /** Expected length of a MAC address string (XX:XX:XX:XX:XX:XX) */
  static readonly MAC_ADDRESS_LENGTH: number = 17;

  /** Expected length of a UUID string (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx) */
  static readonly UUID_LENGTH: number = 36;

  /** Maximum number of operation history entries */
  static readonly MAX_HISTORY_SIZE: number = 500;

  /** Maximum number of cached device entries */
  static readonly MAX_DEVICE_CACHE: number = 100;

  /** Default scan interval in milliseconds */
  static readonly DEFAULT_SCAN_INTERVAL: number = 5000;

  /** Connection stability check interval in milliseconds */
  static readonly CONNECTION_CHECK_INTERVAL: number = 10000;

  /** Auto-reconnect delay in milliseconds */
  static readonly AUTO_RECONNECT_DELAY: number = 3000;

  /** Maximum auto-reconnect attempts */
  static readonly MAX_AUTO_RECONNECT: number = 5;

  /** Data sync chunk size */
  static readonly SYNC_CHUNK_SIZE: number = 50;

  /** Maximum message body length for MAP */
  static readonly MAX_MESSAGE_LENGTH: number = 1600;

  /** Maximum contact entries for PBAP */
  static readonly MAX_CONTACT_ENTRIES: number = 1000;

  /** Health data sampling interval in milliseconds */
  static readonly HEALTH_SAMPLE_INTERVAL: number = 1000;

  /** Audio buffer size for A2DP streaming */
  static readonly AUDIO_BUFFER_SIZE: number = 4096;

  /** Network MTU size for PAN */
  static readonly PAN_MTU_SIZE: number = 1500;

  // ========================================
  // Bluetooth UUID Constants
  // ========================================

  /** A2DP Source UUID */
  static readonly UUID_A2DP_SOURCE: string = '0000110a-0000-1000-8000-00805f9b34fb';

  /** A2DP Sink UUID */
  static readonly UUID_A2DP_SINK: string = '0000110b-0000-1000-8000-00805f9b34fb';

  /** HFP UUID */
  static readonly UUID_HFP: string = '0000111e-0000-1000-8000-00805f9b34fb';

  /** HID UUID */
  static readonly UUID_HID: string = '00001124-0000-1000-8000-00805f9b34fb';

  /** PAN UUID */
  static readonly UUID_PAN: string = '00001116-0000-1000-8000-00805f9b34fb';

  /** PBAP UUID */
  static readonly UUID_PBAP: string = '00001130-0000-1000-8000-00805f9b34fb';

  /** MAP UUID */
  static readonly UUID_MAP: string = '00001134-0000-1000-8000-00805f9b34fb';

  /** AVRCP Controller UUID */
  static readonly UUID_AVRCP_CONTROLLER: string = '0000110e-0000-1000-8000-00805f9b34fb';

  /** AVRCP Target UUID */
  static readonly UUID_AVRCP_TARGET: string = '0000110c-0000-1000-8000-00805f9b34fb';

  /** HDP UUID */
  static readonly UUID_HDP: string = '00001400-0000-1000-8000-00805f9b34fb';

  // ========================================
  // Audio Codec Constants
  // ========================================

  /** SBC audio codec identifier */
  static readonly CODEC_SBC: string = 'SBC';

  /** AAC audio codec identifier */
  static readonly CODEC_AAC: string = 'AAC';

  /** aptX audio codec identifier */
  static readonly CODEC_APTX: string = 'aptX';

  /** LDAC audio codec identifier */
  static readonly CODEC_LDAC: string = 'LDAC';

  /** Default audio sample rate in Hz */
  static readonly DEFAULT_SAMPLE_RATE: number = 44100;

  /** High resolution audio sample rate in Hz */
  static readonly HIRES_SAMPLE_RATE: number = 96000;

  /** Default audio bit rate in Kbps */
  static readonly DEFAULT_BIT_RATE: number = 320;

  /** Minimum audio volume level */
  static readonly MIN_VOLUME: number = 0;

  /** Maximum audio volume level */
  static readonly MAX_VOLUME: number = 100;

  // ========================================
  // HFP Constants
  // ========================================

  /** Maximum HFP speaker volume level */
  static readonly MAX_HFP_SPEAKER_VOLUME: number = 15;

  /** Maximum HFP microphone volume level */
  static readonly MAX_HFP_MIC_VOLUME: number = 15;

  /** HFP call state: no call */
  static readonly CALL_STATE_IDLE: string = 'idle';

  /** HFP call state: incoming call */
  static readonly CALL_STATE_INCOMING: string = 'incoming';

  /** HFP call state: outgoing call */
  static readonly CALL_STATE_OUTGOING: string = 'outgoing';

  /** HFP call state: active call */
  static readonly CALL_STATE_ACTIVE: string = 'active';

  /** HFP call state: call on hold */
  static readonly CALL_STATE_HELD: string = 'held';

  /** HFP call state: call ended */
  static readonly CALL_STATE_ENDED: string = 'ended';

  // ========================================
  // Initialization
  // ========================================

  /**
   * Initialize Bluetooth constants.
   * Validates that all constants are properly configured.
   */
  static initialize(): void {
    // Verify critical constants are set
    if (BluetoothConstants.DOMAIN <= 0) {
      throw new Error('Invalid domain configuration');
    }
    if (BluetoothConstants.MAX_CONNECTED_DEVICES <= 0) {
      throw new Error('Invalid max connected devices');
    }
  }

  /**
   * Get a human-readable error message for an error code.
   * @param errorCode - The error code to look up
   * @returns Human-readable error description
   */
  static getErrorMessage(errorCode: number): string {
    switch (errorCode) {
      case BluetoothConstants.ERROR_PERMISSION_DENIED:
        return 'Permission denied. Please grant Bluetooth permissions.';
      case BluetoothConstants.ERROR_INTERNAL:
        return 'Internal system error. Please try again.';
      case BluetoothConstants.ERROR_BLUETOOTH_DISABLED:
        return 'Bluetooth is disabled. Please enable Bluetooth.';
      case BluetoothConstants.ERROR_DEVICE_NOT_FOUND:
        return 'Device not found. Please ensure the device is in range.';
      case BluetoothConstants.ERROR_CONNECTION_TIMEOUT:
        return 'Connection timed out. Please try again.';
      case BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED:
        return 'Profile not supported by this device.';
      case BluetoothConstants.ERROR_ALREADY_CONNECTED:
        return 'Device is already connected.';
      case BluetoothConstants.ERROR_NOT_PAIRED:
        return 'Device is not paired. Please pair first.';
      case BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED:
        return 'Service discovery failed.';
      case BluetoothConstants.ERROR_AUTHENTICATION_FAILED:
        return 'Authentication failed. Please try pairing again.';
      case BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE:
        return 'Bluetooth resource unavailable.';
      default:
        return 'Unknown error (code: ' + errorCode + ')';
    }
  }

  /**
   * Check if an error code represents a recoverable error.
   * @param errorCode - The error code to check
   * @returns Whether the error is recoverable
   */
  static isRecoverableError(errorCode: number): boolean {
    const recoverableCodes: number[] = [
      BluetoothConstants.ERROR_CONNECTION_TIMEOUT,
      BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE,
      BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED
    ];
    return recoverableCodes.indexOf(errorCode) !== -1;
  }

  /**
   * Check if an error code represents a permanent failure.
   * @param errorCode - The error code to check
   * @returns Whether the error is permanent
   */
  static isPermanentError(errorCode: number): boolean {
    const permanentCodes: number[] = [
      BluetoothConstants.ERROR_PERMISSION_DENIED,
      BluetoothConstants.ERROR_BLUETOOTH_DISABLED,
      BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED
    ];
    return permanentCodes.indexOf(errorCode) !== -1;
  }
}

/**
 * Bluetooth Profile type enumeration.
 * Defines all supported Bluetooth profile types in the sample.
 * Each profile represents a different use case for Bluetooth connectivity.
 */
export enum BluetoothProfileType {
  /** A2DP - Advanced Audio Distribution Profile for high-quality audio streaming */
  A2DP = 'A2DP',
  /** HFP - Hands-Free Profile for phone call handling */
  HFP = 'HFP',
  /** HID - Human Interface Device Profile for keyboards, mice, etc. */
  HID = 'HID',
  /** PAN - Personal Area Network Profile for network sharing */
  PAN = 'PAN',
  /** PBAP - Phone Book Access Profile for contact synchronization */
  PBAP = 'PBAP',
  /** MAP - Message Access Profile for message retrieval */
  MAP = 'MAP',
  /** AVRCP - Audio/Video Remote Control Profile for media control */
  AVRCP = 'AVRCP',
  /** HDP - Health Device Profile for health monitoring devices */
  HDP = 'HDP'
}

/**
 * Bluetooth connection state enumeration.
 * Represents the various states a Bluetooth connection can be in.
 */
export enum BluetoothConnectionState {
  /** Device is not connected */
  DISCONNECTED = 'disconnected',
  /** Connection is being established */
  CONNECTING = 'connecting',
  /** Device is fully connected */
  CONNECTED = 'connected',
  /** Connection is being terminated */
  DISCONNECTING = 'disconnecting',
  /** Connection attempt failed */
  CONNECTION_FAILED = 'connection_failed',
  /** Connection attempt timed out */
  CONNECTION_TIMEOUT = 'connection_timeout'
}

/**
 * Bluetooth scan state enumeration.
 * Represents the states of the device discovery process.
 */
export enum BluetoothScanState {
  /** Scanner is idle, not scanning */
  IDLE = 0,
  /** Currently scanning for devices */
  SCANNING = 1,
  /** Scan completed successfully */
  SCAN_COMPLETE = 2,
  /** Scan failed with an error */
  SCAN_FAILED = 3
}

/**
 * A2DP connection state enumeration.
 * More granular states specific to audio streaming.
 */
export enum A2dpConnectionState {
  /** Audio stream disconnected */
  DISCONNECTED = 'disconnected',
  /** Not connected alias */
  NOT_CONNECTED = 'disconnected',
  /** Audio connection being established */
  CONNECTING = 'connecting',
  /** Base connection established */
  CONNECTED = 'connected',
  /** Disconnecting base connection */
  DISCONNECTING = 'disconnecting',
  /** Audio stream actively connected */
  AUDIO_CONNECTED = 'audio_connected',
  /** Audio stream being disconnected */
  AUDIO_DISCONNECTING = 'audio_disconnecting'
}

/**
 * HFP connection state enumeration.
 * States specific to hands-free profile operation.
 */
export enum HfpConnectionState {
  /** No HFP connection */
  DISCONNECTED = 'disconnected',
  /** Not connected alias */
  NOT_CONNECTED = 'disconnected',
  /** Service level connection established */
  SLC_CONNECTED = 'slc_connected',
  /** HFP connection in progress */
  CONNECTING = 'connecting',
  /** Service level connection in progress */
  SLC_CONNECTING = 'slc_connecting',
  /** Disconnecting */
  DISCONNECTING = 'disconnecting',
  /** Active call in progress */
  IN_CALL = 'in_call',
  /** Voice recognition active */
  VOICE_RECOGNITION = 'voice_recognition'
}

/**
 * HID device sub-type enumeration.
 * Classifies different types of human interface devices.
 */
export enum HidDeviceType {
  /** Bluetooth keyboard */
  KEYBOARD = 'keyboard',
  /** Bluetooth mouse */
  MOUSE = 'mouse',
  /** Bluetooth touchpad */
  TOUCHPAD = 'touchpad',
  /** Bluetooth game controller */
  GAMEPAD = 'gamepad',
  /** Bluetooth remote control */
  REMOTE = 'remote'
}

/**
 * PAN network role enumeration.
 * Defines the role a device plays in a personal area network.
 */
export enum PanNetworkRole {
  /** No network role assigned */
  NONE = 'none',
  /** Network Access Point - provides internet access */
  NAP = 'nap',
  /** Group Ad-hoc Network - creates a network group */
  GN = 'gn',
  /** PAN User - connects to a network */
  PANU = 'panu'
}

/**
 * PBAP contact sort order enumeration.
 */
export enum PbapSortOrder {
  /** Sort contacts alphabetically */
  ALPHABETICAL = 'alphabetical',
  /** Sort contacts by name */
  BY_NAME = 'by_name',
  /** Sort contacts by phone number */
  BY_NUMBER = 'by_number'
}

/**
 * MAP message type enumeration.
 */
export enum MapMessageType {
  /** SMS text message */
  SMS = 'sms',
  /** Email message */
  EMAIL = 'email',
  /** MMS multimedia message */
  MMS = 'mms'
}

/**
 * AVRCP playback state enumeration.
 */
export enum AvrcpPlaybackState {
  /** Playback stopped */
  STOPPED = 'stopped',
  /** Currently playing */
  PLAYING = 'playing',
  /** Playback paused */
  PAUSED = 'paused',
  /** Fast forwarding */
  FAST_FORWARD = 'fast_forward',
  /** Rewinding */
  REWIND = 'rewind'
}

/**
 * HDP health data type enumeration.
 */
export enum HdpDataType {
  /** Heart rate measurement */
  HEART_RATE = 'heart_rate',
  /** Blood pressure measurement */
  BLOOD_PRESSURE = 'blood_pressure',
  /** Body temperature measurement */
  TEMPERATURE = 'temperature',
  /** Blood oxygen saturation */
  BLOOD_OXYGEN = 'blood_oxygen',
  /** Body weight measurement */
  WEIGHT = 'weight'
}

/**
 * Bluetooth bond state enumeration.
 * Represents the pairing state of a Bluetooth device.
 */
export enum BondState {
  /** Device is not bonded */
  NONE = 10,
  /** Bonding is in progress */
  BONDING = 11,
  /** Device is bonded (paired) */
  BONDED = 12
}

/**
 * Bluetooth device class major service enumeration.
 */
export enum MajorServiceClass {
  /** Limited discoverable mode */
  LIMITED_DISCOVERABILITY = 0x0001,
  /** Audio service (A2DP, HFP, etc.) */
  AUDIO = 0x0004,
  /** Telephony service (HFP, PBAP, etc.) */
  TELEPHONY = 0x0008,
  /** Information service (MAP, etc.) */
  INFORMATION = 0x0010,
  /** Networking service (PAN, etc.) */
  NETWORKING = 0x0020,
  /** Capturing service */
  CAPTURING = 0x0040,
  /** Rendering service */
  RENDERING = 0x0080,
  /** Health service (HDP) */
  HEALTH = 0x0100
}
