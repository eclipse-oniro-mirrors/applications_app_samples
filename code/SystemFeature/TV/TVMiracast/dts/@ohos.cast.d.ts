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

declare module '@ohos.cast' {
  import type { AsyncCallback } from '@kit.BasicServicesKit';
  import type { image } from '@kit.ImageKit';

  /**
   * @name Cast
   * @syscap SystemCapability.Multimedia.AVSession.Core
   * @since 9
   */
  namespace Cast {
    /**
     * Register service death callback, notifying the application to clean up resources.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param type Registration Type.
     * @param callback Used to handle the service death event.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function on(type: 'serviceDie', callback: () => void): void;

    /**
     * Unregister service death callback, notifying the application to clean up resources.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param type Registration Type.
     * @param callback Used to handle the service death event.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function off(type: 'serviceDie', callback?: () => void): void;

    /**
     * Register device found callback, reporting remote devices found in service to application.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param type Registration Type.
     * @param callback Used to report remote devices found in service.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function on(type: 'deviceFound', callback: (deviceList: Array<CastRemoteDevice>) => void): void;

    /**
     * Unregister device found callback, reporting remote devices found in service to application.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param type Registration Type.
     * @param callback Used to report remote devices found in service.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function off(type: 'deviceFound', callback?: (deviceList: Array<CastRemoteDevice>) => void): void;

    /**
     * Register session created callback.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param type Registration Type.
     * @param callback Used to return created session.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function on(type: 'sessionCreate', callback: (castSession: CastSession) => void): void;

    /**
     * Unregister session created callback.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param type Registration Type.
     * @param callback Used to return created session.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function off(type: 'sessionCreate', callback?: (castSession: CastSession) => void): void;

    function on(type: 'deviceOffline', callback: (deviceId: string) => void): void;

    function off(type: 'deviceOffline', callback?: (deviceId: string) => void): void;

    /**
     * Start to discovery remote devices available.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param protocols The protocols of remote devices to be discoveried.
     * @param {AsyncCallback<void>} [callback] - void callback.
     * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function startDiscovery(protocols: Array<ProtocolType>, callback: AsyncCallback<void>): void;

    function startDiscovery(protocols: Array<ProtocolType>): Promise<void>;

    /**
     * Stop discovering remote devices.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param {AsyncCallback<void>} [callback] - void callback.
     * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function stopDiscovery(callback: AsyncCallback<void>): void;

    function stopDiscovery(): Promise<void>;

    /**
     * set current device discoverable or undiscoverable.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param isDiscoverable Is current device discoverable.
     * @param {AsyncCallback<void>} [callback] - void callback.
     * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function setDiscoverable(isDiscoverable: boolean, callback: AsyncCallback<void>): void;

    function setDiscoverable(isDiscoverable: boolean): Promise<void>;

    /**
     * create an castSession instance.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param castSessionProperty The property of castSession.
     * @param {AsyncCallback<CastSession>} [callback] - callback.
     * @returns {void | promise<CastSession>} no callback returns Promise otherwise returns void.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function createCastSession(castSessionProperty: CastSessionProperty, callback: AsyncCallback<CastSession>): void;

    function createCastSession(castSessionProperty: CastSessionProperty): Promise<CastSession>;

    /**
     * Release cast service.
     * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
     * @param {AsyncCallback<void>} [callback] - void callback.
     * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    function release(callback: AsyncCallback<void>): void;

    function release(): Promise<void>;

    /**
     * CastSession object.
     * @interface CastSession
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface CastSession {
      /**
       * Register event report callback, reporting event to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle event reported.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'event', callback: (eventId: EventId, eventInfo: string) => void): void;

      /**
       * Unregister event report callback, reporting event to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle event reported.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'event', callback?: (eventId: EventId, eventInfo: string) => void): void;

      /**
       * Register device state callback, reporting current session state of device to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle device state event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'deviceState', callback: (stateEvent: DeviceStateInfo) => void): void;

      /**
       * Unregister device state callback, reporting current session state of device to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle device state event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'deviceState', callback?: (stateEvent: DeviceStateInfo) => void): void;

      on(type: 'deviceRequest', callback: (deviceList: Array<CastRemoteDevice>) => void): void;

      off(type: 'deviceRequest', callback: (deviceList: Array<CastRemoteDevice>) => void): void;

      accept(deviceId: string, accept: boolean, callback: AsyncCallback<void>);

      /**
       * Connect to a remote device discoveried.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param device The cast remote device discoveried from deviceFound callback.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      addDevice(device: CastRemoteDevice, callback: AsyncCallback<void>): void;

      addDevice(device: CastRemoteDevice): Promise<void>;

      /**
       * Disconnect to a remote device connected.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param device The connecting cast remote device.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      removeDevice(deviceId: string, callback: AsyncCallback<void>): void;

      removeDevice(deviceId: string): Promise<void>;

      /**
       * Mute the audio of the specific device.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param deviceId The ID of the specific remote device.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      mute(deviceId: string, callback: AsyncCallback<void>): void;

      mute(deviceId: string): Promise<void>;

      /**
       * Unmute the audio of the specific device.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param deviceId The ID of the specific remote device.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      unMute(deviceId: string, callback: AsyncCallback<void>): void;

      unMute(deviceId: string): Promise<void>;

      /**
       * Get session id of current session instance.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<number>} [callback] - session id of current session instance.
       * @returns {void | Promise<number>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getSessionId(callback: AsyncCallback<string>): void;

      getSessionId(): Promise<string>;

      /**
       * Set properties of current session instance, which is now used in sink side when sessionCreate reports.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param castSessionProperty The properties of castSession.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      setSessionProperty(castSessionProperty: CastSessionProperty, callback: AsyncCallback<void>): void;

      setSessionProperty(castSessionProperty: CastSessionProperty): Promise<void>;

      /**
       * Create mirror player instance.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      createMirrorPlayer(callback: AsyncCallback<MirrorPlayer>): void;

      createMirrorPlayer(): Promise<MirrorPlayer>;

      /**
       * Create stream player instance.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      createStreamPlayer(callback: AsyncCallback<StreamPlayer>): void;

      createStreamPlayer(): Promise<StreamPlayer>;

      /**
       * Release current castSession instance.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR | ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      release(callback: AsyncCallback<void>): void;

      release(): Promise<void>;
    }

    /**
     * MirrorPlayer object.
     * @interface MirrorPlayer
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface MirrorPlayer {
      /**
       * Start to play cast mirror in a device.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR
       * @param deviceId The current device id.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      play(deviceId: string, callback: AsyncCallback<void>): void;

      play(deviceId: string): Promise<void>;

      /**
       * Pause cast mirror in a device.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR
       * @param deviceId The current device id.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      pause(deviceId: string, callback: AsyncCallback<void>): void;

      pause(deviceId: string): Promise<void>;

      /**
       * Set screen for cast mirror.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR
       * @param screenId The id from xcomponent.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      setSurface(surfaceId: string, callback: AsyncCallback<void>): void;

      setSurface(surfaceId: string): Promise<void>;

      /**
       * Release current mirror player instance.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_MIRROR
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      release(callback: AsyncCallback<void>): void;

      release(): Promise<void>;

      setAppInfo(appUid: number, appTokenId: number, appPid: number);

      setCastRoute(isRemote: boolean): void;

      getScreenshot(callback: AsyncCallback<image.PixelMap>): void;

      getScreenshot(): Promise<image.PixelMap>;
    }

    /**
     * StreamPlayer object.
     * @interface StreamPlayer
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface StreamPlayer {
      /**
       * Register stream player state callback, reporting player state to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle player state event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'stateChanged', callback: (playbackState: PlayerStates, isPlayWhenReady: boolean) => void): void;

      /**
       * UnRegister stream player state callback, reporting player state to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle player state event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'stateChanged', callback?: (playbackState: PlayerStates, isPlayWhenReady: boolean) => void): void;

      /**
       * Register stream media resource playing position callback, reporting current position to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to position change event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'positionChanged',
        callback: (position: number, bufferPosition: number, duration: number, timestamp: number) => void): void;

      /**
       * Unregister stream media resource playing position callback, reporting current position to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to position change event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'positionChanged',
        callback?: (position: number, bufferPosition: number, duration: number, timestamp: number) => void): void;

      /**
       * Register stream current media item change report callback, reporting current media item to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle media item changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'mediaItemChanged', callback: (mediaInfo: MediaInfo) => void): void;

      /**
       * Unregister stream current media item change report callback, reporting current media item to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle media item changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'mediaItemChanged', callback?: (mediaInfo: MediaInfo) => void): void;

      /**
       * Register system volume change report callback, reporting current volume to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle volume changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'volumeChanged', callback: (volume: number) => void): void;

      /**
       * Unregister system volume change report callback, reporting current volume to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle volume changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'volumeChanged', callback?: (volume: number) => void): void;

      /**
       * Register stream loop mode report callback, reporting current loop mode to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream loop mode changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'loopModeChanged', callback: (mode: LoopMode) => void): void;

      /**
       * Unregister stream loop mode report callback, reporting current loop mode to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream loop mode changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'loopModeChanged', callback?: (mode: LoopMode) => void): void;

      /**
       * Register stream play speed report callback, reporting current play speed to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream play speed changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'playSpeedChanged', callback: (speed: PlaybackSpeed) => void): void;

      /**
       * Unregister stream play speed report callback, reporting current play speed to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream play speed changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'playSpeedChanged', callback?: (speed: PlaybackSpeed) => void): void;

      /**
       * Register stream player error report callback, reporting error of  player to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream player error event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'error', callback: (errorCode: number, errorMsg: string) => void): void;

      /**
       * Unregister stream player error report callback, reporting error of  player to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream player error event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'error', callback?: (errorCode: number, errorMsg: string) => void): void;

      /**
       * Register stream video size report callback, reporting current video size to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream video size changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'videoSizeChanged', callback: (width: number, height: number) => void): void;

      /**
       * Unregister stream video size report callback, reporting current video size to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to handle stream video size changed event.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'videoSizeChanged', callback?: (width: number, height: number) => void): void;

      /**
       * Register stream next request report callback, reporting next request to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to play next media resource.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'nextRequest', callback: () => void): void;

      /**
       * Unregister stream next request report callback, reporting next request to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to play next media resource.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'nextRequest', callback?: () => void): void;

      /**
       * Register stream next request report callback, reporting previous request to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to play previous media resource.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'previousRequest', callback: () => void): void;

      /**
       * Unregister stream next request report callback, reporting previous request to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to play previous media resource.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'previousRequest', callback?: () => void): void;

      /**
       * Register stream seek done callback, reporting seek done to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to update time after seek.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      on(type: 'seekDone', callback: () => void): void;

      /**
       * Unregister stream seek done callback, reporting seek done to application.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param type Registration Type.
       * @param callback Used to update time after seek.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      off(type: 'seekDone', callback?: () => void): void;

      /**
       * start to init stream and play in the first time.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param mediaInfoHolder The all media infos stream needs.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      start(mediaInfoHolder: MediaInfoHolder, callback: AsyncCallback<void>): void;

      start(mediaInfoHolder: MediaInfoHolder): Promise<void>;

      /**
       * Play stream media resource with a specified index of media list.
       * This is usually used when playing locally.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param index The specified index of media list to be played.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      play(index: number, callback: AsyncCallback<void>): void;

      play(index: number): Promise<void>;

      /**
       * Play current media resource from paused state.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      play(callback: AsyncCallback<void>): void;

      play(): Promise<void>;

      /**
       * pause current media resource.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      pause(callback: AsyncCallback<void>): void;

      pause(): Promise<void>;

      /**
       * Stop current media resource.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      stop(callback: AsyncCallback<void>): void;

      stop(): Promise<void>;

      /**
       * Play next media resource from media list.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      next(callback: AsyncCallback<void>): void;

      next(): Promise<void>;

      /**
       * Play previous media resource from media list.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      previous(callback: AsyncCallback<void>): void;

      previous(): Promise<void>;

      /**
       * Seek to a specified time spot in current media resource.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param timeMs The specified time spot to be seek.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      seek(timeMs: number, callback: AsyncCallback<void>): void;

      seek(timeMs: number): Promise<void>;

      /**
       * Set the system volume.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param volume The volume  to be set.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      setVolume(volume: number, callback: AsyncCallback<void>): void;

      setVolume(volume: number): Promise<void>;

      /**
       * Set the loop mode of the player.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param mode The loop mode  to be set.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      setLoopMode(mode: LoopMode, callback: AsyncCallback<void>): void;

      setLoopMode(mode: LoopMode): Promise<void>;

      /**
       * Set the speed of the player.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param speed The speed to be set.
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      setSpeed(speed: PlaybackSpeed, callback: AsyncCallback<void>): void;

      setSpeed(speed: PlaybackSpeed): Promise<void>;

      /**
       * Get the status of the player.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<PlayerStates>} [callback] - callback.
       * @returns {void | promise<PlayerStates>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getPlayerStatus(callback: AsyncCallback<PlayerStates>): void;

      getPlayerStatus(): Promise<PlayerStates>;

      /**
       * Get the current time position of the playing media resource.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<number>} [callback] - callback.
       * @returns {void | promise<number>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getPosition(callback: AsyncCallback<number>): void;

      getPosition(): Promise<number>;

      /**
       * Get the current system volume.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<number>} [callback] - callback.
       * @returns {void | promise<number>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getVolume(callback: AsyncCallback<number>): void;

      getVolume(): Promise<number>;

      /**
       * Get the current loop mode of the player.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<LoopMode>} [callback] - callback.
       * @returns {void | promise<LoopMode>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getLoopMode(callback: AsyncCallback<LoopMode>): void;

      getLoopMode(): Promise<LoopMode>;

      /**
       * Get the current play speed of the player.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<PlaybackSpeed>} [callback] - callback.
       * @returns {void | promise<PlaybackSpeed>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getSpeed(callback: AsyncCallback<PlaybackSpeed>): void;

      getSpeed(): Promise<PlaybackSpeed>;

      /**
       * Get the current playing media info list.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<MediaInfoHolder>} [callback] - callback.
       * @returns {void | promise<MediaInfoHolder>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      getMediaInfoHolder(callback: AsyncCallback<MediaInfoHolder>): void;

      getMediaInfoHolder(): Promise<MediaInfoHolder>;

      /**
       * Release the stream player instance.
       * @permission ohos.permission.ACCESS_CAST_ENGINE_STREAM
       * @param {AsyncCallback<void>} [callback] - callback.
       * @returns {void | Promise<void>} no callback returns Promise otherwise returns void.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @systemapi
       * @since 9
       */
      release(callback: AsyncCallback<void>): void;

      release(): Promise<void>;
    }

    /**
     * Definition Of player states.
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum PlayerStates {
      /**
       * Error of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_STATE_ERROR = 0,
      /**
       * Idle of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_IDLE = 1,
      /**
       * Initialized of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_INITIALIZED = 2,
      /**
       * Preparing of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_PREPARING = 3,
      /**
       * Prepared of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_PREPARED = 4,
      /**
       * Started of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_STARTED = 5,
      /**
       * Paused of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_PAUSED = 6,
      /**
       * Stopped of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_STOPPED = 7,
      /**
       * Complete of player state playback.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_PLAYBACK_COMPLETE = 8,
      /**
       * Released of player state.
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      PLAYER_RELEASED = 9,
    }

    /**
     * Definition Of playback speed.
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum PlaybackSpeed {
      /**
       * Playback at 0.75x normal speed
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      SPEED_FORWARD_0_75_X = 0,
      /**
       * playback at normal speed
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      SPEED_FORWARD_1_00_X = 1,
      /**
       * playback at 1.25x normal speed
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      SPEED_FORWARD_1_25_X = 2,
      /**
       * playback at 1.75x normal speed
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      SPEED_FORWARD_1_75_X = 3,
      /**
       * playback at 2.0x normal speed
       * @syscap SystemCapability.Multimedia.AVSession.Core
       * @since 9
       */
      SPEED_FORWARD_2_00_X = 4,
    }

    /**
     * Definition Of Loop Play Mode
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum LoopMode {
      /**
       * The default mode is sequential playback
       * @since 9
       */
      LOOP_MODE_SEQUENCE = 0,

      /**
       * Single loop mode
       * @since 9
       */
      LOOP_MODE_SINGLE = 1,

      /**
       * List loop mode
       * @since 9
       */
      LOOP_MODE_LIST = 2,

      /**
       * Shuffle playback mode
       * @since 9
       */
      LOOP_MODE_SHUFFLE = 3,
    }

    /**
     * Definition Of device type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum DeviceType {
      /**
       * Others of device type
       * @since 9
       */
      DEVICE_OTHERS = 0,
      /**
       * Screen player of device type
       * @since 9
       */
      DEVICE_SCREEN_PLAYER = 1,
      /**
       * Hw tv of device type
       * @since 9
       */
      DEVICE_HW_TV = 2,
      /**
       * Sound box of device type
       * @since 9
       */
      DEVICE_SOUND_BOX = 3,
      /**
       * Hicar of device type
       * @since 9
       */
      DEVICE_HICAR = 4,
      /**
       * Mate book of device type
       * @since 9
       */
      DEVICE_MATEBOOK = 5,
      /**
       * Pad of device type
       * @since 9
       */
      DEVICE_PAD = 6,
      /**
       * Cast plus of device type
       * @since 9
       */
      DEVICE_CAST_PLUS = 7
    }

    /**
     * Definition Of Sub device type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum SubDeviceType {
      /**
       * Default device of sub device type
       * @since 9
       */
      SUB_DEVICE_DEFAULT = 0,
      /**
       * Mate book pad of sub device type
       * @since 9
       */
      SUB_DEVICE_MATEBOOK_PAD = 51,
      /**
       * Cast plus white board of sub device type
       * @since 9
       */
      SUB_DEVICE_CAST_PLUS_WHITEBOARD = 0x00B2
    }

    /**
     * Definition Of Trigger type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum TriggerType {
      /**
       * Unspec tag of trigger type
       * @since 9
       */
      UNSPEC_TAG = 0,
      /**
       * Passive match tag of trigger type
       * @since 9
       */
      PASSIVE_MATCH_TAG = 1,
      /**
       * Active match tag of trigger type
       * @since 9
       */
      ACTIVE_MATCH_TAG = 2,
      /**
       * Bind tag of trigger type
       * @since 9
       */
      PASSIVE_BIND_TAG = 3
    }

    /**
     * Definition Of device state
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum DeviceState {
      /**
       * The connecting state of device state
       * @since 9
       */
      CONNECTING = 0,
      /**
       * The connected state of device state
       * @since 9
       */
      CONNECTED = 1,
      /**
       * The paused state of device state
       * @since 9
       */
      PAUSED = 2,
      /**
       * The playing state of device state
       * @since 9
       */
      PLAYING = 3,
      /**
       * The disconnecting state of device state
       * @since 9
       */
      DISCONNECTING = 4,
      /**
       * The disconnected state of device state
       * @since 9
       */
      DISCONNECTED = 5,
      /**
       * The stream state of device state
       * @since 9
       */
      STREAM = 6,
      /**
       * The mirror to ui state of device state
       * @since 9
       */
      MIRROR_TO_UI = 7,
      /**
       * The ui to mirror state of device state
       * @since 9
       */
      UI_TO_MIRROR = 8,
      /**
       * The uicast state of device state
       * @since 9
       */
      UICAST = 9,
      /**
       * 等待对端响应状态
       */
      AUTHING = 10,
      /**
       * The mirror_to_stream state of device state
       * @since 9
       */
      MIRROR_TO_STREAM = 11,
      /**
       * The max  of device state
       * @since 9
       */
      STREAM_TO_MIRROR = 12,
      /**
       * The max  of device state
       * @since 9
       */
      DEVICE_STATE_MAX = 13
    }

    /**
     * Definition Of property type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum PropertyType {
      /**
       * The video size  of property type
       * @since 9
       */
      VIDEO_SIZE = 0,
      /**
       * The video fps  of property type
       * @since 9
       */
      VIDEO_FPS = 1,
      /**
       * The window size  of property type
       * @since 9
       */
      WINDOW_SIZE = 2
    }

    /**
     * Definition Of channel type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum ChannelType {
      /**
       * The soft bus  of channel type
       * @since 9
       */
      SOFT_BUS = 0,
      /**
       * The legacy channel  of channel type
       * @since 9
       */
      LEGACY_CHANNEL = 1
    }

    /**
     * Definition Of protocol type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum ProtocolType {
      /**
       * The cast plus mirror of protocol type
       * @since 9
       */
      CAST_PLUS_MIRROR = 1,
      /**
       * The cast plus stream of protocol type
       * @since 9
       */
      CAST_PLUS_STREAM = 2,
      /**
       * The DLNA of protocol type
       * @since 9
       */
      DLNA = 4,
      /**
       * The DLNA of protocol type
       * @since 9
       */
      MIRACAST = 8,
      /**
       * The cast plus cooperation of protocol type
       * @since 9
       */
      COOPERATION = 32,
    }

    /**
     * Definition Of end type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum EndType {
      /**
       * The cast sink of end type
       * @since 9
       */
      CAST_SINK = 0x10,
      /**
       * The cast source of end type
       * @since 9
       */
      CAST_SOURCE = 0x11
    }

    /**
     * Definition Of event id
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum EventId {
      /**
       * The event begin of event id
       * @since 9
       */
      EVENT_BEGIN = 1,
      /**
       * The event player start of event id
       * @since 9
       */
      EVENT_PLAYER_START = 2000,
      /**
       * The event notify switch to uicast of event id
       * @since 9
       */
      UICAST_NOTIFY_SWITCH_TO_UICAST = 3001,
      /**
       * The event player stop  of event id
       * @since 9
       */
      EVENT_PLAYER_STOP = 2001,
      /**
       * The event end of event id
       * @since 9
       */
      EVENT_END = 5000
    }

    /**
     * Definition of color standard
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum ColorStandard {
      /**
       * The bt709 of color standard
       * @since 9
       */
      BT709 = 1,
      /**
       * The bt601 pal of color standard
       * @since 9
       */
      BT601_PAL = 2,
      /**
       * The bt601 ntsc of color standard
       * @since 9
       */
      BT601_NTSC = 3,
      /**
       * The bt2020 of color standard
       * @since 9
       */
      BT2020 = 6
    }

    /**
     * Definition of video codec type
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum VideoCodecType {
      /**
       * The h264  of video codec type
       * @since 9
       */
      H264 = 1,
      /**
       * The h265  of video codec type
       * @since 9
       */
      H265 = 2
    }

    enum EventCode {
      DEFAULT_EVENT = 0,
      UNKNOWN_EVENT = -99999,
      ERR_CONNECTION_FAILED = -20000,
      ERR_CONNECTION_TIMEOUT = -20001,
      ERR_PIN_CODE_RETRY_COUNT_EXCEEDED = -10000,
      ERR_CANCEL_BY_SINK = -10001,
      ERR_DISTRUST_BY_SINK = -10002,
      ERR_BIND_TIMEOUT = -10003,
      EVT_TRUST_BY_SINK = 10000,
      EVT_CANCEL_BY_SOURCE = 10001,
      EVT_BIND_COMPLETED = 10002,
      EVT_SHOW_AUTHORIZE_UI = 10003
    }

    /**
     * Definition of cast mode
     * @enum {number}
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    enum CastMode {
      /**
       * The mirror cast of cast mode type
       * @since 9
       */
      MIRROR_CAST = 1,
      /**
       * The app cast of cast mode type
       * @since 9
       */
      APP_CAST = 2
    }

    /**
     * Definition of device state info
     * @interface DeviceStateInfo
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface DeviceStateInfo {
      /**
       * The deviceState of device state info
       * @since 9
       */
      deviceState: DeviceState;

      /**
       * The deviceId of device state info
       * @since 9
       */
      deviceId: string;

      /**
       * The eventCode of device state info
       * @since 9
       */
      eventCode: EventCode;

      /**
       * The dfxcode of device state info
       * @since 9
       */
      dfxCode: number;
    }

    /**
     * Definition of cast remote device
     * @interface CastRemoteDevice
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface CastRemoteDevice {
      /**
       * The deviceId of cast remote device
       * @since 9
       */
      deviceId: string;

      /**
       * The deviceName of cast remote device
       * @since 9
       */
      deviceName: string;

      /**
       * The deviceType of cast remote device
       * @since 9
       */
      deviceType: DeviceType;

      /**
       * The subDeviceType of cast remote device
       * @since 9
       */
      subDeviceType: SubDeviceType;

      /**
       * The ipAddress of cast remote device
       * @since 9
       */
      ipAddress: string;

      /**
       * The channelType of cast remote device
       * @since 9
       */
      channelType: ChannelType;

      /**
       * The networkId of cast remote device
       * @since 9
       */
      networkId: string;

      /**
       * The isLeagacy of cast remote device
       * @since 9
       */
      isLeagacy: boolean;
    }

    /**
     * Definition of media info
     * @interface MediaInfo
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface MediaInfo {
      /**
       * The mediaId of media info
       * @since 9
       */
      mediaId: string;

      /**
       * The mediaName of media info
       * @since 9
       */
      mediaName: string;

      /**
       * The mediaUrl of media info
       * @since 9
       */
      mediaUrl: string;

      /**
       * The mediaType of media info
       * @since 9
       */
      mediaType: string;

      /**
       * The mediaSize of media info
       * @since 9
       */
      mediaSize: number;

      /**
       * The startPosition of media info
       * @since 9
       */
      startPosition: number;

      /**
       * The duration of media info
       * @since 9
       */
      duration: number;

      /**
       * The closingCreditsPosition of media info
       * @since 9
       */
      closingCreditsPosition: number;

      /**
       * The albumCoverUrl of media info
       * @since 9
       */
      albumCoverUrl: string;

      /**
       * The albumTitle of media info
       * @since 9
       */
      albumTitle: string;

      /**
       * The mediaArtist of media info
       * @since 9
       */
      mediaArtist: string;

      /**
       * The lrcUrl of media info
       * @since 9
       */
      lrcUrl: string;

      /**
       * The lrcContent of media info
       * @since 9
       */
      lrcContent: string;

      /**
       * The appIconUrl of media info
       * @since 9
       */
      appIconUrl: string;

      /**
       * The appName of media info
       * @since 9
       */
      appName: string;
    }

    /**
     * Definition of media info holder
     * @interface MediaInfoHolder
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface MediaInfoHolder {
      /**
       * The currentIndex of media info holder
       * @since 9
       */
      currentIndex: number;

      /**
       * The mediaInfoList of media info holder
       * @since 9
       */
      mediaInfoList: Array<MediaInfo>;

      /**
       * The progressRefreshInterval of media info holder
       * @since 9
       */
      progressRefreshInterval: number;
    }

    /**
     * Definition of audio property
     * @interface AudioProperty
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface AudioProperty {
      /**
       * The sampleRate of audio property
       * @since 9
       */
      sampleRate: number;

      /**
       * The sampleBitWidth of audio property
       * @since 9
       */
      sampleBitWidth: number;

      /**
       * The channelConfig of audio property
       * @since 9
       */
      channelConfig: number;

      /**
       * The bitrate of audio property
       * @since 9
       */
      bitrate: number;

      /**
       * The codec of audio property
       * @since 9
       */
      codec: number;
    }

    /**
     * Definition of video property
     * @interface videoProperty
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface VideoProperty {
      /**
       * The videoWidth of video property
       * @since 9
       */
      videoWidth: number;

      /**
       * The videoHeight of video property
       * @since 9
       */
      videoHeight: number;

      /**
       * The fps of video property
       * @since 9
       */
      fps: number;

      /**
       * The codecType of video property
       * @since 9
       */
      codecType: VideoCodecType;

      /**
       * The gop of video property
       * @since 9
       */
      gop: number;

      /**
       * The bitrate of video property
       * @since 9
       */
      bitrate: number;

      /**
       * The minBitrate of video property
       * @since 9
       */
      minBitrate: number;

      /**
       * The maxBitrate of video property
       * @since 9
       */
      maxBitrate: number;

      /**
       * The dpi of video property
       * @since 9
       */
      dpi: number;

      /**
       * The colorStandard of video property
       * @since 9
       */
      colorStandard: ColorStandard;

      /**
       * The screenWidth of video property
       * @since 9
       */
      screenWidth: number;

      /**
       * The screenHeight of video property
       * @since 9
       */
      screenHeight: number;

      /**
       * The profile of video property
       * @since 9
       */
      profile: number;

      /**
       * The level of video property
       * @since 9
       */
      level: number;
    }

    /**
     * Definition of window property
     * @interface WindowProperty
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface WindowProperty {
      /**
       * The startX of window property
       * @since 9
       */
      startX: number;

      /**
       * The startY of window property
       * @since 9
       */
      startY: number;

      /**
       * The width of window property
       * @since 9
       */
      width: number;

      /**
       * The height of window property
       * @since 9
       */
      height: number;
    }

    /**
     * Definition of cast session property
     * @interface CastSessionProperty
     * @syscap SystemCapability.Multimedia.AVSession.Core
     * @systemapi
     * @since 9
     */
    interface CastSessionProperty {
      /**
       * The protocolType of cast session property
       * @since 9
       */
      protocolType: ProtocolType;

      /**
       * The endType of cast session property
       * @since 9
       */
      endType: EndType;

      /**
       * The audioProperty of cast session property
       * @since 9
       */
      audioProperty: AudioProperty;

      /**
       * The videoProperty of cast session property
       * @since 9
       */
      videoProperty: VideoProperty;

      /**
       * The windowProperty of cast session property
       * @since 9
       */
      windowProperty: WindowProperty;
    }
  }

  export default Cast;
}
