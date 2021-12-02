<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" labelsEnabled="0" version="3.16.4-Hannover" simplifyDrawingHints="1" readOnly="0" maxScale="0" minScale="100000000" simplifyAlgorithm="0" simplifyMaxScale="1" simplifyLocal="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal startExpression="" fixedDuration="0" startField="" durationField="" enabled="0" mode="0" endExpression="" endField="" durationUnit="min" accumulate="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 graduatedMethod="GraduatedColor" type="graduatedSymbol" enableorderby="0" symbollevels="0" attr="day(age(now(), to_date(left(&quot;osm_timestamp&quot;,10))))" forceraster="0">
    <ranges>
      <range render="true" lower="0.000000000000000" upper="182.000000000000000" label="&lt; 6 mois" symbol="0"/>
      <range render="true" lower="182.000000000000000" upper="365.000000000000000" label="6 mois - 1 an" symbol="1"/>
      <range render="true" lower="365.000000000000000" upper="730.000000000000000" label="1 - 2 ans" symbol="2"/>
      <range render="true" lower="730.000000000000000" upper="1095.000000000000000" label="2 - 3 ans" symbol="3"/>
      <range render="true" lower="1095.000000000000000" upper="1825.000000000000000" label="3 - 5 ans" symbol="4"/>
      <range render="true" lower="1825.000000000000000" upper="5480.928414351851643" label="> 5 ans" symbol="5"/>
    </ranges>
    <symbols>
      <symbol force_rhr="0" type="line" name="0" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="line" name="1" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,51,51,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="line" name="2" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,102,102,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="line" name="3" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,153,153,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="line" name="4" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,204,204,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="line" name="5" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol force_rhr="0" type="line" name="0" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="225,89,137,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <colorramp type="gradient" name="[source]">
      <prop v="255,0,0,255" k="color1"/>
      <prop v="255,255,255,255" k="color2"/>
      <prop v="0" k="discrete"/>
      <prop v="gradient" k="rampType"/>
    </colorramp>
    <classificationMethod id="Pretty">
      <symmetricMode symmetrypoint="0" enabled="0" astride="0"/>
      <labelFormat labelprecision="4" trimtrailingzeroes="1" format="%1 - %2"/>
      <parameters>
        <Option/>
      </parameters>
      <extraInformation/>
    </classificationMethod>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="&quot;addr:housename&quot;"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory opacity="1" penAlpha="255" lineSizeType="MM" minimumSize="0" sizeType="MM" penWidth="0" sizeScale="3x:0,0,0,0,0,0" barWidth="5" enabled="0" diagramOrientation="Up" scaleDependency="Area" lineSizeScale="3x:0,0,0,0,0,0" backgroundColor="#ffffff" penColor="#000000" showAxis="1" spacing="5" minScaleDenominator="0" width="15" height="15" scaleBasedVisibility="0" direction="0" labelPlacementMethod="XHeight" maxScaleDenominator="1e+08" spacingUnit="MM" backgroundAlpha="255" rotationOffset="270" spacingUnitScale="3x:0,0,0,0,0,0">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
      <axisSymbol>
        <symbol force_rhr="0" type="line" name="" alpha="1" clip_to_extent="1">
          <layer class="SimpleLine" enabled="1" locked="0" pass="0">
            <prop v="0" k="align_dash_pattern"/>
            <prop v="square" k="capstyle"/>
            <prop v="5;2" k="customdash"/>
            <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
            <prop v="MM" k="customdash_unit"/>
            <prop v="0" k="dash_pattern_offset"/>
            <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
            <prop v="MM" k="dash_pattern_offset_unit"/>
            <prop v="0" k="draw_inside_polygon"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="35,35,35,255" k="line_color"/>
            <prop v="solid" k="line_style"/>
            <prop v="0.26" k="line_width"/>
            <prop v="MM" k="line_width_unit"/>
            <prop v="0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="0" k="ring_filter"/>
            <prop v="0" k="tweak_dash_pattern_on_corners"/>
            <prop v="0" k="use_custom_dash"/>
            <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" placement="2" dist="0" showAll="1" linePlacementFlags="18" priority="0" obstacle="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field name="osm_id" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="access" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ascent" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="addr:housename" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="addr:housenumber" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="addr:interpolation" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="admin_level" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="aerialway" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="aeroway" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="amenity" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="barrier" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bicycle" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="brand" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bridge" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="boundary" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="building" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="construction" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="covered" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="culvert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cutting" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="denomination" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="descent" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="disused" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="direction" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="distance" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="embankment" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="foot" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="generator:source" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="harbour" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="highway" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="historic" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="horse" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="intermittent" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="junction" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="landuse" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="layer" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="leaf_type" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="leaf_cycle" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="leisure" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lock" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="man_made" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="military" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="motorcar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="natural" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="network" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="office" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="osmc:symbol" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="oneway" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="operator" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="place" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="population" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="power" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="power_source" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="produce" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="public_transport" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="railway" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ref" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="religion" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="route" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="service" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="shop" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sport" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="surface" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="toll" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tourism" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tower:type" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tracktype" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="trail_visibility" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="trees" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tunnel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="signed_direction" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="water" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="waterway" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="wetland" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="width" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="wood" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="z_order" configurationFlags="None">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="way_area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="osm_timestamp" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="osm_id" index="0"/>
    <alias name="" field="access" index="1"/>
    <alias name="" field="ascent" index="2"/>
    <alias name="" field="addr:housename" index="3"/>
    <alias name="" field="addr:housenumber" index="4"/>
    <alias name="" field="addr:interpolation" index="5"/>
    <alias name="" field="admin_level" index="6"/>
    <alias name="" field="aerialway" index="7"/>
    <alias name="" field="aeroway" index="8"/>
    <alias name="" field="amenity" index="9"/>
    <alias name="" field="area" index="10"/>
    <alias name="" field="barrier" index="11"/>
    <alias name="" field="bicycle" index="12"/>
    <alias name="" field="brand" index="13"/>
    <alias name="" field="bridge" index="14"/>
    <alias name="" field="boundary" index="15"/>
    <alias name="" field="building" index="16"/>
    <alias name="" field="construction" index="17"/>
    <alias name="" field="covered" index="18"/>
    <alias name="" field="culvert" index="19"/>
    <alias name="" field="cutting" index="20"/>
    <alias name="" field="denomination" index="21"/>
    <alias name="" field="descent" index="22"/>
    <alias name="" field="disused" index="23"/>
    <alias name="" field="direction" index="24"/>
    <alias name="" field="distance" index="25"/>
    <alias name="" field="embankment" index="26"/>
    <alias name="" field="foot" index="27"/>
    <alias name="" field="generator:source" index="28"/>
    <alias name="" field="harbour" index="29"/>
    <alias name="" field="highway" index="30"/>
    <alias name="" field="historic" index="31"/>
    <alias name="" field="horse" index="32"/>
    <alias name="" field="intermittent" index="33"/>
    <alias name="" field="junction" index="34"/>
    <alias name="" field="landuse" index="35"/>
    <alias name="" field="layer" index="36"/>
    <alias name="" field="leaf_type" index="37"/>
    <alias name="" field="leaf_cycle" index="38"/>
    <alias name="" field="leisure" index="39"/>
    <alias name="" field="lock" index="40"/>
    <alias name="" field="man_made" index="41"/>
    <alias name="" field="military" index="42"/>
    <alias name="" field="motorcar" index="43"/>
    <alias name="" field="name" index="44"/>
    <alias name="" field="natural" index="45"/>
    <alias name="" field="network" index="46"/>
    <alias name="" field="office" index="47"/>
    <alias name="" field="osmc:symbol" index="48"/>
    <alias name="" field="oneway" index="49"/>
    <alias name="" field="operator" index="50"/>
    <alias name="" field="place" index="51"/>
    <alias name="" field="population" index="52"/>
    <alias name="" field="power" index="53"/>
    <alias name="" field="power_source" index="54"/>
    <alias name="" field="produce" index="55"/>
    <alias name="" field="public_transport" index="56"/>
    <alias name="" field="railway" index="57"/>
    <alias name="" field="ref" index="58"/>
    <alias name="" field="religion" index="59"/>
    <alias name="" field="route" index="60"/>
    <alias name="" field="service" index="61"/>
    <alias name="" field="shop" index="62"/>
    <alias name="" field="sport" index="63"/>
    <alias name="" field="surface" index="64"/>
    <alias name="" field="toll" index="65"/>
    <alias name="" field="tourism" index="66"/>
    <alias name="" field="tower:type" index="67"/>
    <alias name="" field="tracktype" index="68"/>
    <alias name="" field="trail_visibility" index="69"/>
    <alias name="" field="trees" index="70"/>
    <alias name="" field="tunnel" index="71"/>
    <alias name="" field="signed_direction" index="72"/>
    <alias name="" field="water" index="73"/>
    <alias name="" field="waterway" index="74"/>
    <alias name="" field="wetland" index="75"/>
    <alias name="" field="width" index="76"/>
    <alias name="" field="wood" index="77"/>
    <alias name="" field="z_order" index="78"/>
    <alias name="" field="way_area" index="79"/>
    <alias name="" field="osm_timestamp" index="80"/>
  </aliases>
  <defaults>
    <default field="osm_id" applyOnUpdate="0" expression=""/>
    <default field="access" applyOnUpdate="0" expression=""/>
    <default field="ascent" applyOnUpdate="0" expression=""/>
    <default field="addr:housename" applyOnUpdate="0" expression=""/>
    <default field="addr:housenumber" applyOnUpdate="0" expression=""/>
    <default field="addr:interpolation" applyOnUpdate="0" expression=""/>
    <default field="admin_level" applyOnUpdate="0" expression=""/>
    <default field="aerialway" applyOnUpdate="0" expression=""/>
    <default field="aeroway" applyOnUpdate="0" expression=""/>
    <default field="amenity" applyOnUpdate="0" expression=""/>
    <default field="area" applyOnUpdate="0" expression=""/>
    <default field="barrier" applyOnUpdate="0" expression=""/>
    <default field="bicycle" applyOnUpdate="0" expression=""/>
    <default field="brand" applyOnUpdate="0" expression=""/>
    <default field="bridge" applyOnUpdate="0" expression=""/>
    <default field="boundary" applyOnUpdate="0" expression=""/>
    <default field="building" applyOnUpdate="0" expression=""/>
    <default field="construction" applyOnUpdate="0" expression=""/>
    <default field="covered" applyOnUpdate="0" expression=""/>
    <default field="culvert" applyOnUpdate="0" expression=""/>
    <default field="cutting" applyOnUpdate="0" expression=""/>
    <default field="denomination" applyOnUpdate="0" expression=""/>
    <default field="descent" applyOnUpdate="0" expression=""/>
    <default field="disused" applyOnUpdate="0" expression=""/>
    <default field="direction" applyOnUpdate="0" expression=""/>
    <default field="distance" applyOnUpdate="0" expression=""/>
    <default field="embankment" applyOnUpdate="0" expression=""/>
    <default field="foot" applyOnUpdate="0" expression=""/>
    <default field="generator:source" applyOnUpdate="0" expression=""/>
    <default field="harbour" applyOnUpdate="0" expression=""/>
    <default field="highway" applyOnUpdate="0" expression=""/>
    <default field="historic" applyOnUpdate="0" expression=""/>
    <default field="horse" applyOnUpdate="0" expression=""/>
    <default field="intermittent" applyOnUpdate="0" expression=""/>
    <default field="junction" applyOnUpdate="0" expression=""/>
    <default field="landuse" applyOnUpdate="0" expression=""/>
    <default field="layer" applyOnUpdate="0" expression=""/>
    <default field="leaf_type" applyOnUpdate="0" expression=""/>
    <default field="leaf_cycle" applyOnUpdate="0" expression=""/>
    <default field="leisure" applyOnUpdate="0" expression=""/>
    <default field="lock" applyOnUpdate="0" expression=""/>
    <default field="man_made" applyOnUpdate="0" expression=""/>
    <default field="military" applyOnUpdate="0" expression=""/>
    <default field="motorcar" applyOnUpdate="0" expression=""/>
    <default field="name" applyOnUpdate="0" expression=""/>
    <default field="natural" applyOnUpdate="0" expression=""/>
    <default field="network" applyOnUpdate="0" expression=""/>
    <default field="office" applyOnUpdate="0" expression=""/>
    <default field="osmc:symbol" applyOnUpdate="0" expression=""/>
    <default field="oneway" applyOnUpdate="0" expression=""/>
    <default field="operator" applyOnUpdate="0" expression=""/>
    <default field="place" applyOnUpdate="0" expression=""/>
    <default field="population" applyOnUpdate="0" expression=""/>
    <default field="power" applyOnUpdate="0" expression=""/>
    <default field="power_source" applyOnUpdate="0" expression=""/>
    <default field="produce" applyOnUpdate="0" expression=""/>
    <default field="public_transport" applyOnUpdate="0" expression=""/>
    <default field="railway" applyOnUpdate="0" expression=""/>
    <default field="ref" applyOnUpdate="0" expression=""/>
    <default field="religion" applyOnUpdate="0" expression=""/>
    <default field="route" applyOnUpdate="0" expression=""/>
    <default field="service" applyOnUpdate="0" expression=""/>
    <default field="shop" applyOnUpdate="0" expression=""/>
    <default field="sport" applyOnUpdate="0" expression=""/>
    <default field="surface" applyOnUpdate="0" expression=""/>
    <default field="toll" applyOnUpdate="0" expression=""/>
    <default field="tourism" applyOnUpdate="0" expression=""/>
    <default field="tower:type" applyOnUpdate="0" expression=""/>
    <default field="tracktype" applyOnUpdate="0" expression=""/>
    <default field="trail_visibility" applyOnUpdate="0" expression=""/>
    <default field="trees" applyOnUpdate="0" expression=""/>
    <default field="tunnel" applyOnUpdate="0" expression=""/>
    <default field="signed_direction" applyOnUpdate="0" expression=""/>
    <default field="water" applyOnUpdate="0" expression=""/>
    <default field="waterway" applyOnUpdate="0" expression=""/>
    <default field="wetland" applyOnUpdate="0" expression=""/>
    <default field="width" applyOnUpdate="0" expression=""/>
    <default field="wood" applyOnUpdate="0" expression=""/>
    <default field="z_order" applyOnUpdate="0" expression=""/>
    <default field="way_area" applyOnUpdate="0" expression=""/>
    <default field="osm_timestamp" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" field="osm_id" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="access" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="ascent" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="addr:housename" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="addr:housenumber" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="addr:interpolation" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="admin_level" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="aerialway" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="aeroway" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="amenity" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="area" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="barrier" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="bicycle" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="brand" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="bridge" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="boundary" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="building" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="construction" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="covered" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="culvert" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="cutting" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="denomination" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="descent" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="disused" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="direction" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="distance" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="embankment" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="foot" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="generator:source" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="harbour" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="highway" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="historic" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="horse" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="intermittent" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="junction" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="landuse" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="layer" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="leaf_type" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="leaf_cycle" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="leisure" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="lock" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="man_made" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="military" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="motorcar" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="name" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="natural" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="network" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="office" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="osmc:symbol" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="oneway" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="operator" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="place" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="population" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="power" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="power_source" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="produce" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="public_transport" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="railway" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="ref" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="religion" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="route" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="service" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="shop" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="sport" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="surface" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="toll" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="tourism" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="tower:type" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="tracktype" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="trail_visibility" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="trees" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="tunnel" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="signed_direction" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="water" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="waterway" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="wetland" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="width" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="wood" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="z_order" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="way_area" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="osm_timestamp" exp_strength="0" unique_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="osm_id"/>
    <constraint exp="" desc="" field="access"/>
    <constraint exp="" desc="" field="ascent"/>
    <constraint exp="" desc="" field="addr:housename"/>
    <constraint exp="" desc="" field="addr:housenumber"/>
    <constraint exp="" desc="" field="addr:interpolation"/>
    <constraint exp="" desc="" field="admin_level"/>
    <constraint exp="" desc="" field="aerialway"/>
    <constraint exp="" desc="" field="aeroway"/>
    <constraint exp="" desc="" field="amenity"/>
    <constraint exp="" desc="" field="area"/>
    <constraint exp="" desc="" field="barrier"/>
    <constraint exp="" desc="" field="bicycle"/>
    <constraint exp="" desc="" field="brand"/>
    <constraint exp="" desc="" field="bridge"/>
    <constraint exp="" desc="" field="boundary"/>
    <constraint exp="" desc="" field="building"/>
    <constraint exp="" desc="" field="construction"/>
    <constraint exp="" desc="" field="covered"/>
    <constraint exp="" desc="" field="culvert"/>
    <constraint exp="" desc="" field="cutting"/>
    <constraint exp="" desc="" field="denomination"/>
    <constraint exp="" desc="" field="descent"/>
    <constraint exp="" desc="" field="disused"/>
    <constraint exp="" desc="" field="direction"/>
    <constraint exp="" desc="" field="distance"/>
    <constraint exp="" desc="" field="embankment"/>
    <constraint exp="" desc="" field="foot"/>
    <constraint exp="" desc="" field="generator:source"/>
    <constraint exp="" desc="" field="harbour"/>
    <constraint exp="" desc="" field="highway"/>
    <constraint exp="" desc="" field="historic"/>
    <constraint exp="" desc="" field="horse"/>
    <constraint exp="" desc="" field="intermittent"/>
    <constraint exp="" desc="" field="junction"/>
    <constraint exp="" desc="" field="landuse"/>
    <constraint exp="" desc="" field="layer"/>
    <constraint exp="" desc="" field="leaf_type"/>
    <constraint exp="" desc="" field="leaf_cycle"/>
    <constraint exp="" desc="" field="leisure"/>
    <constraint exp="" desc="" field="lock"/>
    <constraint exp="" desc="" field="man_made"/>
    <constraint exp="" desc="" field="military"/>
    <constraint exp="" desc="" field="motorcar"/>
    <constraint exp="" desc="" field="name"/>
    <constraint exp="" desc="" field="natural"/>
    <constraint exp="" desc="" field="network"/>
    <constraint exp="" desc="" field="office"/>
    <constraint exp="" desc="" field="osmc:symbol"/>
    <constraint exp="" desc="" field="oneway"/>
    <constraint exp="" desc="" field="operator"/>
    <constraint exp="" desc="" field="place"/>
    <constraint exp="" desc="" field="population"/>
    <constraint exp="" desc="" field="power"/>
    <constraint exp="" desc="" field="power_source"/>
    <constraint exp="" desc="" field="produce"/>
    <constraint exp="" desc="" field="public_transport"/>
    <constraint exp="" desc="" field="railway"/>
    <constraint exp="" desc="" field="ref"/>
    <constraint exp="" desc="" field="religion"/>
    <constraint exp="" desc="" field="route"/>
    <constraint exp="" desc="" field="service"/>
    <constraint exp="" desc="" field="shop"/>
    <constraint exp="" desc="" field="sport"/>
    <constraint exp="" desc="" field="surface"/>
    <constraint exp="" desc="" field="toll"/>
    <constraint exp="" desc="" field="tourism"/>
    <constraint exp="" desc="" field="tower:type"/>
    <constraint exp="" desc="" field="tracktype"/>
    <constraint exp="" desc="" field="trail_visibility"/>
    <constraint exp="" desc="" field="trees"/>
    <constraint exp="" desc="" field="tunnel"/>
    <constraint exp="" desc="" field="signed_direction"/>
    <constraint exp="" desc="" field="water"/>
    <constraint exp="" desc="" field="waterway"/>
    <constraint exp="" desc="" field="wetland"/>
    <constraint exp="" desc="" field="width"/>
    <constraint exp="" desc="" field="wood"/>
    <constraint exp="" desc="" field="z_order"/>
    <constraint exp="" desc="" field="way_area"/>
    <constraint exp="" desc="" field="osm_timestamp"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;wood&quot;" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" name="osm_id" width="-1" hidden="0"/>
      <column type="field" name="access" width="-1" hidden="0"/>
      <column type="field" name="ascent" width="-1" hidden="0"/>
      <column type="field" name="addr:housename" width="-1" hidden="0"/>
      <column type="field" name="addr:housenumber" width="-1" hidden="0"/>
      <column type="field" name="addr:interpolation" width="-1" hidden="0"/>
      <column type="field" name="admin_level" width="-1" hidden="0"/>
      <column type="field" name="aerialway" width="-1" hidden="0"/>
      <column type="field" name="aeroway" width="-1" hidden="0"/>
      <column type="field" name="amenity" width="-1" hidden="0"/>
      <column type="field" name="area" width="-1" hidden="0"/>
      <column type="field" name="barrier" width="-1" hidden="0"/>
      <column type="field" name="bicycle" width="-1" hidden="0"/>
      <column type="field" name="brand" width="-1" hidden="0"/>
      <column type="field" name="bridge" width="-1" hidden="0"/>
      <column type="field" name="boundary" width="-1" hidden="0"/>
      <column type="field" name="building" width="-1" hidden="0"/>
      <column type="field" name="construction" width="-1" hidden="0"/>
      <column type="field" name="covered" width="-1" hidden="0"/>
      <column type="field" name="culvert" width="-1" hidden="0"/>
      <column type="field" name="cutting" width="-1" hidden="0"/>
      <column type="field" name="denomination" width="-1" hidden="0"/>
      <column type="field" name="descent" width="-1" hidden="0"/>
      <column type="field" name="disused" width="-1" hidden="0"/>
      <column type="field" name="direction" width="-1" hidden="0"/>
      <column type="field" name="distance" width="-1" hidden="0"/>
      <column type="field" name="embankment" width="-1" hidden="0"/>
      <column type="field" name="foot" width="-1" hidden="0"/>
      <column type="field" name="generator:source" width="-1" hidden="0"/>
      <column type="field" name="harbour" width="-1" hidden="0"/>
      <column type="field" name="highway" width="-1" hidden="0"/>
      <column type="field" name="historic" width="-1" hidden="0"/>
      <column type="field" name="horse" width="-1" hidden="0"/>
      <column type="field" name="intermittent" width="-1" hidden="0"/>
      <column type="field" name="junction" width="-1" hidden="0"/>
      <column type="field" name="landuse" width="-1" hidden="0"/>
      <column type="field" name="layer" width="-1" hidden="0"/>
      <column type="field" name="leaf_type" width="-1" hidden="0"/>
      <column type="field" name="leaf_cycle" width="-1" hidden="0"/>
      <column type="field" name="leisure" width="-1" hidden="0"/>
      <column type="field" name="lock" width="-1" hidden="0"/>
      <column type="field" name="man_made" width="-1" hidden="0"/>
      <column type="field" name="military" width="-1" hidden="0"/>
      <column type="field" name="motorcar" width="-1" hidden="0"/>
      <column type="field" name="name" width="-1" hidden="0"/>
      <column type="field" name="natural" width="-1" hidden="0"/>
      <column type="field" name="network" width="-1" hidden="0"/>
      <column type="field" name="office" width="-1" hidden="0"/>
      <column type="field" name="osmc:symbol" width="-1" hidden="0"/>
      <column type="field" name="oneway" width="-1" hidden="0"/>
      <column type="field" name="operator" width="-1" hidden="0"/>
      <column type="field" name="place" width="-1" hidden="0"/>
      <column type="field" name="population" width="-1" hidden="0"/>
      <column type="field" name="power" width="-1" hidden="0"/>
      <column type="field" name="power_source" width="-1" hidden="0"/>
      <column type="field" name="produce" width="-1" hidden="0"/>
      <column type="field" name="public_transport" width="-1" hidden="0"/>
      <column type="field" name="railway" width="-1" hidden="0"/>
      <column type="field" name="ref" width="-1" hidden="0"/>
      <column type="field" name="religion" width="-1" hidden="0"/>
      <column type="field" name="route" width="-1" hidden="0"/>
      <column type="field" name="service" width="-1" hidden="0"/>
      <column type="field" name="shop" width="-1" hidden="0"/>
      <column type="field" name="sport" width="-1" hidden="0"/>
      <column type="field" name="surface" width="-1" hidden="0"/>
      <column type="field" name="toll" width="-1" hidden="0"/>
      <column type="field" name="tourism" width="-1" hidden="0"/>
      <column type="field" name="tower:type" width="-1" hidden="0"/>
      <column type="field" name="tracktype" width="-1" hidden="0"/>
      <column type="field" name="trail_visibility" width="-1" hidden="0"/>
      <column type="field" name="trees" width="-1" hidden="0"/>
      <column type="field" name="tunnel" width="-1" hidden="0"/>
      <column type="field" name="signed_direction" width="-1" hidden="0"/>
      <column type="field" name="water" width="-1" hidden="0"/>
      <column type="field" name="waterway" width="-1" hidden="0"/>
      <column type="field" name="wetland" width="-1" hidden="0"/>
      <column type="field" name="width" width="-1" hidden="0"/>
      <column type="field" name="wood" width="-1" hidden="0"/>
      <column type="field" name="z_order" width="-1" hidden="0"/>
      <column type="field" name="way_area" width="-1" hidden="0"/>
      <column type="field" name="osm_timestamp" width="170" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="access"/>
    <field editable="1" name="addr:housename"/>
    <field editable="1" name="addr:housenumber"/>
    <field editable="1" name="addr:interpolation"/>
    <field editable="1" name="admin_level"/>
    <field editable="1" name="aerialway"/>
    <field editable="1" name="aeroway"/>
    <field editable="1" name="amenity"/>
    <field editable="1" name="area"/>
    <field editable="1" name="ascent"/>
    <field editable="1" name="barrier"/>
    <field editable="1" name="bicycle"/>
    <field editable="1" name="boundary"/>
    <field editable="1" name="brand"/>
    <field editable="1" name="bridge"/>
    <field editable="1" name="building"/>
    <field editable="1" name="construction"/>
    <field editable="1" name="covered"/>
    <field editable="1" name="culvert"/>
    <field editable="1" name="cutting"/>
    <field editable="1" name="denomination"/>
    <field editable="1" name="descent"/>
    <field editable="1" name="direction"/>
    <field editable="1" name="distance"/>
    <field editable="1" name="disused"/>
    <field editable="1" name="embankment"/>
    <field editable="1" name="foot"/>
    <field editable="1" name="generator:source"/>
    <field editable="1" name="harbour"/>
    <field editable="1" name="highway"/>
    <field editable="1" name="historic"/>
    <field editable="1" name="horse"/>
    <field editable="1" name="intermittent"/>
    <field editable="1" name="junction"/>
    <field editable="1" name="landuse"/>
    <field editable="1" name="layer"/>
    <field editable="1" name="leaf_cycle"/>
    <field editable="1" name="leaf_type"/>
    <field editable="1" name="leisure"/>
    <field editable="1" name="lock"/>
    <field editable="1" name="man_made"/>
    <field editable="1" name="military"/>
    <field editable="1" name="motorcar"/>
    <field editable="1" name="name"/>
    <field editable="1" name="natural"/>
    <field editable="1" name="network"/>
    <field editable="1" name="office"/>
    <field editable="1" name="oneway"/>
    <field editable="1" name="operator"/>
    <field editable="1" name="osm_id"/>
    <field editable="1" name="osm_timestamp"/>
    <field editable="1" name="osmc:symbol"/>
    <field editable="1" name="place"/>
    <field editable="1" name="population"/>
    <field editable="1" name="power"/>
    <field editable="1" name="power_source"/>
    <field editable="1" name="produce"/>
    <field editable="1" name="public_transport"/>
    <field editable="1" name="railway"/>
    <field editable="1" name="ref"/>
    <field editable="1" name="religion"/>
    <field editable="1" name="route"/>
    <field editable="1" name="service"/>
    <field editable="1" name="shop"/>
    <field editable="1" name="signed_direction"/>
    <field editable="1" name="sport"/>
    <field editable="1" name="surface"/>
    <field editable="1" name="toll"/>
    <field editable="1" name="tourism"/>
    <field editable="1" name="tower:type"/>
    <field editable="1" name="tracktype"/>
    <field editable="1" name="trail_visibility"/>
    <field editable="1" name="trees"/>
    <field editable="1" name="tunnel"/>
    <field editable="1" name="water"/>
    <field editable="1" name="waterway"/>
    <field editable="1" name="way_area"/>
    <field editable="1" name="wetland"/>
    <field editable="1" name="width"/>
    <field editable="1" name="wood"/>
    <field editable="1" name="z_order"/>
  </editable>
  <labelOnTop>
    <field name="access" labelOnTop="0"/>
    <field name="addr:housename" labelOnTop="0"/>
    <field name="addr:housenumber" labelOnTop="0"/>
    <field name="addr:interpolation" labelOnTop="0"/>
    <field name="admin_level" labelOnTop="0"/>
    <field name="aerialway" labelOnTop="0"/>
    <field name="aeroway" labelOnTop="0"/>
    <field name="amenity" labelOnTop="0"/>
    <field name="area" labelOnTop="0"/>
    <field name="ascent" labelOnTop="0"/>
    <field name="barrier" labelOnTop="0"/>
    <field name="bicycle" labelOnTop="0"/>
    <field name="boundary" labelOnTop="0"/>
    <field name="brand" labelOnTop="0"/>
    <field name="bridge" labelOnTop="0"/>
    <field name="building" labelOnTop="0"/>
    <field name="construction" labelOnTop="0"/>
    <field name="covered" labelOnTop="0"/>
    <field name="culvert" labelOnTop="0"/>
    <field name="cutting" labelOnTop="0"/>
    <field name="denomination" labelOnTop="0"/>
    <field name="descent" labelOnTop="0"/>
    <field name="direction" labelOnTop="0"/>
    <field name="distance" labelOnTop="0"/>
    <field name="disused" labelOnTop="0"/>
    <field name="embankment" labelOnTop="0"/>
    <field name="foot" labelOnTop="0"/>
    <field name="generator:source" labelOnTop="0"/>
    <field name="harbour" labelOnTop="0"/>
    <field name="highway" labelOnTop="0"/>
    <field name="historic" labelOnTop="0"/>
    <field name="horse" labelOnTop="0"/>
    <field name="intermittent" labelOnTop="0"/>
    <field name="junction" labelOnTop="0"/>
    <field name="landuse" labelOnTop="0"/>
    <field name="layer" labelOnTop="0"/>
    <field name="leaf_cycle" labelOnTop="0"/>
    <field name="leaf_type" labelOnTop="0"/>
    <field name="leisure" labelOnTop="0"/>
    <field name="lock" labelOnTop="0"/>
    <field name="man_made" labelOnTop="0"/>
    <field name="military" labelOnTop="0"/>
    <field name="motorcar" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="natural" labelOnTop="0"/>
    <field name="network" labelOnTop="0"/>
    <field name="office" labelOnTop="0"/>
    <field name="oneway" labelOnTop="0"/>
    <field name="operator" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
    <field name="osm_timestamp" labelOnTop="0"/>
    <field name="osmc:symbol" labelOnTop="0"/>
    <field name="place" labelOnTop="0"/>
    <field name="population" labelOnTop="0"/>
    <field name="power" labelOnTop="0"/>
    <field name="power_source" labelOnTop="0"/>
    <field name="produce" labelOnTop="0"/>
    <field name="public_transport" labelOnTop="0"/>
    <field name="railway" labelOnTop="0"/>
    <field name="ref" labelOnTop="0"/>
    <field name="religion" labelOnTop="0"/>
    <field name="route" labelOnTop="0"/>
    <field name="service" labelOnTop="0"/>
    <field name="shop" labelOnTop="0"/>
    <field name="signed_direction" labelOnTop="0"/>
    <field name="sport" labelOnTop="0"/>
    <field name="surface" labelOnTop="0"/>
    <field name="toll" labelOnTop="0"/>
    <field name="tourism" labelOnTop="0"/>
    <field name="tower:type" labelOnTop="0"/>
    <field name="tracktype" labelOnTop="0"/>
    <field name="trail_visibility" labelOnTop="0"/>
    <field name="trees" labelOnTop="0"/>
    <field name="tunnel" labelOnTop="0"/>
    <field name="water" labelOnTop="0"/>
    <field name="waterway" labelOnTop="0"/>
    <field name="way_area" labelOnTop="0"/>
    <field name="wetland" labelOnTop="0"/>
    <field name="width" labelOnTop="0"/>
    <field name="wood" labelOnTop="0"/>
    <field name="z_order" labelOnTop="0"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"addr:housename"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
