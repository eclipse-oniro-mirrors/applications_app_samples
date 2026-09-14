import abilityTest from './Ability.test';
import AudioCapturerTest from './AudioCapturerTest.test';
import AudioLoopbackDemoTest from './AudioLoopbackTest.test';
import AudioStreamManagerTest from './AudioStreamManager.test';
import PlaybackCaptureTest from './PlaybackCaptureTest.test';
import AudioVolumeGroupManagerTest from './macManager.test';

export default function testsuite() {
  abilityTest();
  AudioCapturerTest();
  AudioLoopbackDemoTest();
  AudioStreamManagerTest();
  PlaybackCaptureTest();
}
