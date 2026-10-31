import abilityTest from './Ability.test';
import fastBufferBasicsTest from './FastBufferBasics.test';
import streamPipelineTest from './StreamPipeline.test';
import fastBufferUtilTest from './FastBufferUtil.test';
import streamFileUtilTest from './StreamFileUtil.test';
import perfTimerTest from './PerfTimer.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import tlvUtilTest from './TlvUtil.test';

export default function testsuite() {
  abilityTest();
  fastBufferBasicsTest();
  fastBufferUtilTest();
  streamFileUtilTest();
  perfTimerTest();
  deviceUtilTest();
  logUtilTest();
  streamPipelineTest();
  tlvUtilTest();
}
