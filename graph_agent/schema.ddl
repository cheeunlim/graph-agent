CREATE TABLE APPLIES_TO (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  condition STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE APPLIES_TO_CATEGORY (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE AbuseCase (
  node_id STRING(36) NOT NULL,
  consequence STRING(MAX),
  description STRING(MAX),
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Actor (
  node_id STRING(36) NOT NULL,
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Benefit (
  node_id STRING(36) NOT NULL,
  description STRING(MAX),
  type STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE BusinessProcess (
  node_id STRING(36) NOT NULL,
  description STRING(MAX),
  name STRING(MAX),
  process STRING(MAX),
  rule_1 STRING(MAX),
  rule_2 STRING(MAX),
  step_1 STRING(MAX),
  step_2 STRING(MAX),
  step_3 STRING(MAX),
  trigger STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Condition (
  node_id STRING(36) NOT NULL,
  reason STRING(MAX),
  detail STRING(MAX),
  type STRING(MAX),
  step STRING(MAX),
  duration STRING(MAX),
  cost_bearer STRING(MAX),
  period STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Cost (
  node_id STRING(36) NOT NULL,
  description STRING(MAX),
  payer STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE DEFINES (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE DEFINES_CASE (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE DEFINES_TIER (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE DOES_NOT_APPLY_TO (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE Department (
  node_id STRING(36) NOT NULL,
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Document (
  node_id STRING(36) NOT NULL,
  document_number STRING(MAX),
  governing_department STRING(MAX),
  last_modified STRING(MAX),
  name STRING(MAX),
  subject STRING(MAX),
  last_modified_date STRING(MAX),
  scope_description STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE GOVERNED_BY (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_BENEFIT (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_CONDITION (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_DEPARTMENT (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_EXCEPTION_FLOW (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_POLICY (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_PROCESS (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_RESTRICTION (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_RULE (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_SECTION (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_SUB_PROCESS (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  condition STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_TIER (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE HAS_TIMEFRAME (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE INCLUDES (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE INCURS_COST (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE INITIATES (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  action STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE IS_DEFINED_IN (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE IS_RESPONSIBLE_FOR (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE MembershipProgram (
  node_id STRING(36) NOT NULL,
  name STRING(MAX),
  source_article STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE MembershipTier (
  node_id STRING(36) NOT NULL,
  benefits STRING(MAX),
  condition STRING(MAX),
  criteria STRING(MAX),
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE NEXT_STEP (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  condition STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE Organization (
  node_id STRING(36) NOT NULL,
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE PERFORMS (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  action STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE PRECEDES (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE PROVIDES_BENEFIT (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE PaymentMethod (
  node_id STRING(36) NOT NULL,
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE PointSystem (
  node_id STRING(36) NOT NULL,
  name STRING(MAX),
  source_article STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Policy (
  node_id STRING(36) NOT NULL,
  algorithm STRING(MAX),
  clawback_condition STRING(MAX),
  consequence_of_refusal STRING(MAX),
  cost_basis STRING(MAX),
  deduction_method STRING(MAX),
  defective_item STRING(MAX),
  disclaimer STRING(MAX),
  document_title STRING(MAX),
  effective_date STRING(MAX),
  exception STRING(MAX),
  guidance STRING(MAX),
  local_destruction_logic STRING(MAX),
  method STRING(MAX),
  name STRING(MAX),
  payer_of_duties STRING(MAX),
  principle STRING(MAX),
  refund_basis STRING(MAX),
  rule STRING(MAX),
  shipping_term STRING(MAX),
  simple_remorse STRING(MAX),
  types STRING(MAX),
  usage_threshold STRING(MAX),
  validity_period STRING(MAX),
  expiration STRING(MAX),
  purpose STRING(MAX),
  clawback_rule STRING(MAX),
  update_cycle STRING(MAX),
  min_usage STRING(MAX),
  description STRING(MAX),
  redemption_logic STRING(MAX),
  consequence_for_violation STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE PolicyDocument (
  node_id STRING(36) NOT NULL,
  company STRING(MAX),
  last_modified_date STRING(MAX),
  title STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE PolicySection (
  node_id STRING(36) NOT NULL,
  article STRING(MAX),
  purpose STRING(MAX),
  title STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Process (
  node_id STRING(36) NOT NULL,
  action STRING(MAX),
  condition_1 STRING(MAX),
  condition_2 STRING(MAX),
  description STRING(MAX),
  name STRING(MAX),
  status_change STRING(MAX),
  step_1 STRING(MAX),
  step_2 STRING(MAX),
  steps STRING(MAX),
  trigger STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE ProcessStep (
  node_id STRING(36) NOT NULL,
  activity STRING(MAX),
  data_status STRING(MAX),
  logic STRING(MAX),
  name STRING(MAX),
  status_name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE ProductCategory (
  node_id STRING(36) NOT NULL,
  condition STRING(MAX),
  name STRING(MAX),
  return_rejection_criteria STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE RELATED_TO (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  detail STRING(MAX),
  refund_period STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE Restriction (
  node_id STRING(36) NOT NULL,
  details STRING(MAX),
  reason STRING(MAX),
  source_article STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Rule (
  node_id STRING(36) NOT NULL,
  action STRING(MAX),
  condition STRING(MAX),
  details STRING(MAX),
  method STRING(MAX),
  name STRING(MAX),
  source_article STRING(MAX),
  validity STRING(MAX),
  value STRING(MAX),
  title STRING(MAX),
  disclaimer STRING(MAX),
  validity_period STRING(MAX),
  description STRING(MAX),
  step_1 STRING(MAX),
  type STRING(MAX),
  step_4 STRING(MAX),
  article STRING(MAX),
  alternative STRING(MAX),
  step_3 STRING(MAX),
  frequency STRING(MAX),
  step_2 STRING(MAX),
  cost_basis STRING(MAX),
  step_5 STRING(MAX),
  abandonment_logic STRING(MAX),
  detail STRING(MAX),
  refund_basis STRING(MAX),
  reason STRING(MAX),
  criteria STRING(MAX),
  shipping_term STRING(MAX),
  consequence_for_refusal STRING(MAX),
  payer STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE STARTS_WITH (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
) PRIMARY KEY(edge_id);

CREATE TABLE Service (
  node_id STRING(36) NOT NULL,
  description STRING(MAX),
  exclusion_reason STRING(MAX),
  name STRING(MAX),
  related_document STRING(MAX),
  scope STRING(MAX),
  special_rule STRING(MAX),
  reason_for_exclusion STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE System (
  node_id STRING(36) NOT NULL,
  function STRING(MAX),
  name STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE TimeConstraint (
  node_id STRING(36) NOT NULL,
  basis STRING(MAX),
  duration STRING(MAX),
  payment_method STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE distribution_centers (
  id INT64 NOT NULL,
  name STRING(MAX),
  latitude FLOAT64,
  longitude FLOAT64,
  distribution_center_geom STRING(MAX),
) PRIMARY KEY(id);

CREATE TABLE events (
  id INT64 NOT NULL,
  user_id INT64,
  sequence_number INT64,
  session_id STRING(MAX),
  created_at TIMESTAMP,
  ip_address STRING(MAX),
  city STRING(MAX),
  state STRING(MAX),
  postal_code STRING(MAX),
  browser STRING(MAX),
  traffic_source STRING(MAX),
  uri STRING(MAX),
  event_type STRING(MAX),
) PRIMARY KEY(id);

CREATE TABLE inventory_items (
  id INT64 NOT NULL,
  product_id INT64,
  created_at TIMESTAMP,
  sold_at TIMESTAMP,
  cost FLOAT64,
  product_category STRING(MAX),
  product_name STRING(MAX),
  product_brand STRING(MAX),
  product_retail_price FLOAT64,
  product_department STRING(MAX),
  product_sku STRING(MAX),
  product_distribution_center_id INT64,
) PRIMARY KEY(id);

CREATE TABLE order_items (
  id INT64 NOT NULL,
  order_id INT64,
  user_id INT64,
  product_id INT64,
  inventory_item_id INT64,
  status STRING(50),
  created_at TIMESTAMP,
  shipped_at TIMESTAMP,
  delivered_at TIMESTAMP,
  returned_at TIMESTAMP,
  sale_price FLOAT64,
) PRIMARY KEY(id);

CREATE TABLE orders (
  order_id INT64 NOT NULL,
  user_id INT64 NOT NULL,
  status STRING(MAX),
  gender STRING(10),
  created_at TIMESTAMP,
  returned_at TIMESTAMP,
  shipped_at TIMESTAMP,
  delivered_at TIMESTAMP,
  num_of_item STRING(MAX),
) PRIMARY KEY(order_id);

CREATE TABLE products (
  id INT64 NOT NULL,
  cost FLOAT64,
  category STRING(MAX),
  name STRING(MAX),
  brand STRING(MAX),
  retail_price FLOAT64,
  department STRING(MAX),
  sku STRING(MAX),
  distribution_center_id INT64 NOT NULL,
) PRIMARY KEY(id);

CREATE TABLE users (
  id INT64 NOT NULL,
  first_name STRING(MAX),
  last_name STRING(MAX),
  email STRING(MAX),
  age INT64,
  gender STRING(10),
  state STRING(MAX),
  street_address STRING(MAX),
  postal_code STRING(MAX),
  city STRING(MAX),
  country STRING(MAX),
  latitude FLOAT64,
  longitude FLOAT64,
  traffic_source STRING(MAX),
  created_at TIMESTAMP,
  user_geom STRING(MAX),
) PRIMARY KEY(id);

CREATE PROPERTY GRAPH R2G
  NODE TABLES(
    distribution_centers
      KEY(id)
      LABEL distribution_centers PROPERTIES(
        distribution_center_geom,
        id,
        latitude,
        longitude,
        name),

    events
      KEY(id)
      LABEL events PROPERTIES(
        browser,
        city,
        created_at,
        event_type,
        id,
        ip_address,
        postal_code,
        sequence_number,
        session_id,
        state,
        traffic_source,
        uri,
        user_id),

    inventory_items
      KEY(id)
      LABEL inventory_items PROPERTIES(
        cost,
        created_at,
        id,
        product_brand,
        product_category,
        product_department,
        product_distribution_center_id,
        product_id,
        product_name,
        product_retail_price,
        product_sku,
        sold_at),

    orders
      KEY(order_id)
      LABEL orders PROPERTIES(
        created_at,
        delivered_at,
        gender,
        num_of_item,
        order_id,
        returned_at,
        shipped_at,
        status,
        user_id),

    products
      KEY(id)
      LABEL products PROPERTIES(
        brand,
        category,
        cost,
        department,
        distribution_center_id,
        id,
        name,
        retail_price,
        sku),

    users
      KEY(id)
      LABEL users PROPERTIES(
        age,
        city,
        country,
        created_at,
        email,
        first_name,
        gender,
        id,
        last_name,
        latitude,
        longitude,
        postal_code,
        state,
        street_address,
        traffic_source,
        user_geom)
  )
  EDGE TABLES(
    order_items AS contains_item
      KEY(id)
      SOURCE KEY(order_id) REFERENCES orders(order_id)
      DESTINATION KEY(inventory_item_id) REFERENCES inventory_items(id)
      LABEL contains_item PROPERTIES(
        created_at,
        delivered_at,
        id,
        inventory_item_id,
        order_id,
        product_id,
        returned_at,
        sale_price,
        shipped_at,
        status,
        user_id),

    inventory_items AS is_product
      KEY(id)
      SOURCE KEY(id) REFERENCES inventory_items(id)
      DESTINATION KEY(product_id) REFERENCES products(id)
      LABEL is_product PROPERTIES(
        cost,
        created_at,
        id,
        product_brand,
        product_category,
        product_department,
        product_distribution_center_id,
        product_id,
        product_name,
        product_retail_price,
        product_sku,
        sold_at),

    events AS performed_event
      KEY(id)
      SOURCE KEY(user_id) REFERENCES users(id)
      DESTINATION KEY(id) REFERENCES events(id)
      LABEL performed_event PROPERTIES(
        browser,
        city,
        created_at,
        event_type,
        id,
        ip_address,
        postal_code,
        sequence_number,
        session_id,
        state,
        traffic_source,
        uri,
        user_id),

    orders AS places
      KEY(order_id)
      SOURCE KEY(user_id) REFERENCES users(id)
      DESTINATION KEY(order_id) REFERENCES orders(order_id)
      LABEL places PROPERTIES(
        created_at,
        delivered_at,
        gender,
        num_of_item,
        order_id,
        returned_at,
        shipped_at,
        status,
        user_id),

    inventory_items AS stocked_at
      KEY(id)
      SOURCE KEY(id) REFERENCES inventory_items(id)
      DESTINATION KEY(product_distribution_center_id) REFERENCES distribution_centers(id)
      LABEL stocked_at PROPERTIES(
        cost,
        created_at,
        id,
        product_brand,
        product_category,
        product_department,
        product_distribution_center_id,
        product_id,
        product_name,
        product_retail_price,
        product_sku,
        sold_at),

    products AS supplied_by
      KEY(id)
      SOURCE KEY(id) REFERENCES products(id)
      DESTINATION KEY(distribution_center_id) REFERENCES distribution_centers(id)
      LABEL supplied_by PROPERTIES(
        brand,
        category,
        cost,
        department,
        distribution_center_id,
        id,
        name,
        retail_price,
        sku)
  );

CREATE OR REPLACE PROPERTY GRAPH U2G
  NODE TABLES(
    AbuseCase
      KEY(node_id)
      LABEL AbuseCase PROPERTIES(
        consequence,
        description,
        name,
        node_id),

    Actor
      KEY(node_id)
      LABEL Actor PROPERTIES(
        name,
        node_id),

    Benefit
      KEY(node_id)
      LABEL Benefit PROPERTIES(
        description,
        node_id,
        type),

    BusinessProcess
      KEY(node_id)
      LABEL BusinessProcess PROPERTIES(
        description,
        name,
        node_id,
        process,
        rule_1,
        rule_2,
        step_1,
        step_2,
        step_3,
        trigger),

    Condition
      KEY(node_id)
      LABEL Condition PROPERTIES(
        cost_bearer,
        detail,
        duration,
        node_id,
        period,
        reason,
        step,
        type),

    Department
      KEY(node_id)
      LABEL Department PROPERTIES(
        name,
        node_id),

    Document
      KEY(node_id)
      LABEL Document PROPERTIES(
        document_number,
        governing_department,
        last_modified,
        last_modified_date,
        name,
        node_id,
        scope_description,
        subject),

    MembershipProgram
      KEY(node_id)
      LABEL MembershipProgram PROPERTIES(
        name,
        node_id,
        source_article),

    MembershipTier
      KEY(node_id)
      LABEL MembershipTier PROPERTIES(
        benefits,
        condition,
        criteria,
        name,
        node_id),

    Organization
      KEY(node_id)
      LABEL Organization PROPERTIES(
        name,
        node_id),

    PaymentMethod
      KEY(node_id)
      LABEL PaymentMethod PROPERTIES(
        name,
        node_id),

    PointSystem
      KEY(node_id)
      LABEL PointSystem PROPERTIES(
        name,
        node_id,
        source_article),

    `Policy`
      KEY(node_id)
      LABEL `Policy` PROPERTIES(
        algorithm,
        clawback_condition,
        clawback_rule,
        consequence_for_violation,
        consequence_of_refusal,
        cost_basis,
        deduction_method,
        defective_item,
        description,
        disclaimer,
        document_title,
        effective_date,
        exception,
        expiration,
        guidance,
        local_destruction_logic,
        method,
        min_usage,
        name,
        node_id,
        payer_of_duties,
        principle,
        purpose,
        redemption_logic,
        refund_basis,
        rule,
        shipping_term,
        simple_remorse,
        types,
        update_cycle,
        usage_threshold,
        validity_period),

    PolicyDocument
      KEY(node_id)
      LABEL PolicyDocument PROPERTIES(
        company,
        last_modified_date,
        node_id,
        title),

    PolicySection
      KEY(node_id)
      LABEL PolicySection PROPERTIES(
        article,
        node_id,
        purpose,
        title),

    ProcessStep
      KEY(node_id)
      LABEL ProcessStep PROPERTIES(
        activity,
        data_status,
        logic,
        name,
        node_id,
        status_name),

    ProductCategory
      KEY(node_id)
      LABEL ProductCategory PROPERTIES(
        condition,
        name,
        node_id,
        return_rejection_criteria),

    Rule
      KEY(node_id)
      LABEL Rule PROPERTIES(
        abandonment_logic,
        action,
        alternative,
        article,
        condition,
        consequence_for_refusal,
        cost_basis,
        criteria,
        description,
        detail,
        details,
        disclaimer,
        frequency,
        method,
        name,
        node_id,
        payer,
        reason,
        refund_basis,
        shipping_term,
        source_article,
        step_1,
        step_2,
        step_3,
        step_4,
        step_5,
        title,
        type,
        validity,
        validity_period,
        value),

    Service
      KEY(node_id)
      LABEL Service PROPERTIES(
        description,
        exclusion_reason,
        name,
        node_id,
        reason_for_exclusion,
        related_document,
        scope,
        special_rule),

    System
      KEY(node_id)
      LABEL System PROPERTIES(
        `function` AS `function`,
        name,
        node_id)
  )
  EDGE TABLES(
    APPLIES_TO AS APPLIES_TO_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES ProductCategory(node_id)
      LABEL APPLIES_TO_0 PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    APPLIES_TO AS APPLIES_TO_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES Service(node_id)
      LABEL APPLIES_TO_1 PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    APPLIES_TO AS APPLIES_TO_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES ProductCategory(node_id)
      LABEL APPLIES_TO_2 PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicySection(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipProgram(node_id)
      LABEL DEFINES_0 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES BusinessProcess(node_id)
      LABEL DEFINES_1 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES `Policy`(node_id)
      LABEL DEFINES_2 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_3
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicySection(node_id)
      DESTINATION KEY(target_id) REFERENCES PointSystem(node_id)
      LABEL DEFINES_3 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES_CASE
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES AbuseCase(node_id)
      LABEL DEFINES_CASE PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES_TIER
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipTier(node_id)
      LABEL DEFINES_TIER PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DOES_NOT_APPLY_TO
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES Service(node_id)
      LABEL DOES_NOT_APPLY_TO PROPERTIES(
        edge_id,
        source_id,
        target_id),

    GOVERNED_BY AS GOVERNED_BY_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES `Policy`(node_id)
      LABEL GOVERNED_BY_0 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    GOVERNED_BY AS GOVERNED_BY_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Service(node_id)
      DESTINATION KEY(target_id) REFERENCES `Policy`(node_id)
      LABEL GOVERNED_BY_1 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_BENEFIT
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES MembershipTier(node_id)
      DESTINATION KEY(target_id) REFERENCES Benefit(node_id)
      LABEL HAS_BENEFIT PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_CONDITION
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES Condition(node_id)
      LABEL HAS_CONDITION PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_DEPARTMENT
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Organization(node_id)
      DESTINATION KEY(target_id) REFERENCES Department(node_id)
      LABEL HAS_DEPARTMENT PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RESTRICTION
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES Condition(node_id)
      LABEL HAS_RESTRICTION PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES MembershipProgram(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_0 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PointSystem(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_1 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicySection(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_2 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_3
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_3 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_4
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_4 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_SECTION
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicyDocument(node_id)
      DESTINATION KEY(target_id) REFERENCES PolicySection(node_id)
      LABEL HAS_SECTION PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_SUB_PROCESS
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES BusinessProcess(node_id)
      LABEL HAS_SUB_PROCESS PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    HAS_TIER
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES MembershipProgram(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipTier(node_id)
      LABEL HAS_TIER PROPERTIES(
        edge_id,
        source_id,
        target_id),

    INCLUDES
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES BusinessProcess(node_id)
      LABEL INCLUDES PROPERTIES(
        edge_id,
        source_id,
        target_id),

    INITIATES
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Actor(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL INITIATES PROPERTIES(
        action,
        edge_id,
        source_id,
        target_id),

    IS_RESPONSIBLE_FOR
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Department(node_id)
      DESTINATION KEY(target_id) REFERENCES Document(node_id)
      LABEL IS_RESPONSIBLE_FOR PROPERTIES(
        edge_id,
        source_id,
        target_id),

    PERFORMS
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES System(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL PERFORMS PROPERTIES(
        action,
        edge_id,
        source_id,
        target_id),

    PRECEDES
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES ProcessStep(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL PRECEDES PROPERTIES(
        edge_id,
        source_id,
        target_id),

    RELATED_TO AS RELATED_TO_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES PointSystem(node_id)
      LABEL RELATED_TO_0 PROPERTIES(
        detail,
        edge_id,
        refund_period,
        source_id,
        target_id),

    RELATED_TO AS RELATED_TO_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipProgram(node_id)
      LABEL RELATED_TO_1 PROPERTIES(
        detail,
        edge_id,
        refund_period,
        source_id,
        target_id),

    RELATED_TO AS RELATED_TO_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES PaymentMethod(node_id)
      LABEL RELATED_TO_2 PROPERTIES(
        detail,
        edge_id,
        refund_period,
        source_id,
        target_id),

    STARTS_WITH
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL STARTS_WITH PROPERTIES(
        edge_id,
        source_id,
        target_id)
  );

CREATE OR REPLACE PROPERTY GRAPH U2G_2
  NODE TABLES(
    AbuseCase
      KEY(node_id)
      LABEL AbuseCase PROPERTIES(
        consequence,
        description,
        name,
        node_id),

    Actor
      KEY(node_id)
      LABEL Actor PROPERTIES(
        name,
        node_id),

    Benefit
      KEY(node_id)
      LABEL Benefit PROPERTIES(
        description,
        node_id,
        type),

    BusinessProcess
      KEY(node_id)
      LABEL BusinessProcess PROPERTIES(
        description,
        name,
        node_id,
        process,
        rule_1,
        rule_2,
        step_1,
        step_2,
        step_3,
        trigger),

    Condition
      KEY(node_id)
      LABEL Condition PROPERTIES(
        cost_bearer,
        detail,
        duration,
        node_id,
        period,
        reason,
        step,
        type),

    Department
      KEY(node_id)
      LABEL Department PROPERTIES(
        name,
        node_id),

    Document
      KEY(node_id)
      LABEL Document PROPERTIES(
        document_number,
        governing_department,
        last_modified,
        last_modified_date,
        name,
        node_id,
        scope_description,
        subject),

    MembershipProgram
      KEY(node_id)
      LABEL MembershipProgram PROPERTIES(
        name,
        node_id,
        source_article),

    MembershipTier
      KEY(node_id)
      LABEL MembershipTier PROPERTIES(
        benefits,
        condition,
        criteria,
        name,
        node_id),

    Organization
      KEY(node_id)
      LABEL Organization PROPERTIES(
        name,
        node_id),

    PaymentMethod
      KEY(node_id)
      LABEL PaymentMethod PROPERTIES(
        name,
        node_id),

    PointSystem
      KEY(node_id)
      LABEL PointSystem PROPERTIES(
        name,
        node_id,
        source_article),

    `Policy`
      KEY(node_id)
      LABEL `Policy` PROPERTIES(
        algorithm,
        clawback_condition,
        clawback_rule,
        consequence_for_violation,
        consequence_of_refusal,
        cost_basis,
        deduction_method,
        defective_item,
        description,
        disclaimer,
        document_title,
        effective_date,
        exception,
        expiration,
        guidance,
        local_destruction_logic,
        method,
        min_usage,
        name,
        node_id,
        payer_of_duties,
        principle,
        purpose,
        redemption_logic,
        refund_basis,
        rule,
        shipping_term,
        simple_remorse,
        types,
        update_cycle,
        usage_threshold,
        validity_period),

    PolicyDocument
      KEY(node_id)
      LABEL PolicyDocument PROPERTIES(
        company,
        last_modified_date,
        node_id,
        title),

    PolicySection
      KEY(node_id)
      LABEL PolicySection PROPERTIES(
        article,
        node_id,
        purpose,
        title),

    ProcessStep
      KEY(node_id)
      LABEL ProcessStep PROPERTIES(
        activity,
        data_status,
        logic,
        name,
        node_id,
        status_name),

    ProductCategory
      KEY(node_id)
      LABEL ProductCategory PROPERTIES(
        condition,
        name,
        node_id,
        return_rejection_criteria),

    Rule
      KEY(node_id)
      LABEL Rule PROPERTIES(
        abandonment_logic,
        action,
        alternative,
        article,
        condition,
        consequence_for_refusal,
        cost_basis,
        criteria,
        description,
        detail,
        details,
        disclaimer,
        frequency,
        method,
        name,
        node_id,
        payer,
        reason,
        refund_basis,
        shipping_term,
        source_article,
        step_1,
        step_2,
        step_3,
        step_4,
        step_5,
        title,
        type,
        validity,
        validity_period,
        value),

    Service
      KEY(node_id)
      LABEL Service PROPERTIES(
        description,
        exclusion_reason,
        name,
        node_id,
        reason_for_exclusion,
        related_document,
        scope,
        special_rule),

    System
      KEY(node_id)
      LABEL System PROPERTIES(
        `function` AS `function`,
        name,
        node_id)
  )
  EDGE TABLES(
    APPLIES_TO AS APPLIES_TO_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES ProductCategory(node_id)
      LABEL APPLIES_TO_0 PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    APPLIES_TO AS APPLIES_TO_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES Service(node_id)
      LABEL APPLIES_TO_1 PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    APPLIES_TO AS APPLIES_TO_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES ProductCategory(node_id)
      LABEL APPLIES_TO_2 PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES BusinessProcess(node_id)
      LABEL DEFINES_0 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicySection(node_id)
      DESTINATION KEY(target_id) REFERENCES PointSystem(node_id)
      LABEL DEFINES_1 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES `Policy`(node_id)
      LABEL DEFINES_2 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES AS DEFINES_3
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicySection(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipProgram(node_id)
      LABEL DEFINES_3 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES_CASE
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES AbuseCase(node_id)
      LABEL DEFINES_CASE PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DEFINES_TIER
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipTier(node_id)
      LABEL DEFINES_TIER PROPERTIES(
        edge_id,
        source_id,
        target_id),

    DOES_NOT_APPLY_TO
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Document(node_id)
      DESTINATION KEY(target_id) REFERENCES Service(node_id)
      LABEL DOES_NOT_APPLY_TO PROPERTIES(
        edge_id,
        source_id,
        target_id),

    GOVERNED_BY AS GOVERNED_BY_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES `Policy`(node_id)
      LABEL GOVERNED_BY_0 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    GOVERNED_BY AS GOVERNED_BY_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Service(node_id)
      DESTINATION KEY(target_id) REFERENCES `Policy`(node_id)
      LABEL GOVERNED_BY_1 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_BENEFIT
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES MembershipTier(node_id)
      DESTINATION KEY(target_id) REFERENCES Benefit(node_id)
      LABEL HAS_BENEFIT PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_CONDITION
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES Condition(node_id)
      LABEL HAS_CONDITION PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_DEPARTMENT
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Organization(node_id)
      DESTINATION KEY(target_id) REFERENCES Department(node_id)
      LABEL HAS_DEPARTMENT PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RESTRICTION
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES Condition(node_id)
      LABEL HAS_RESTRICTION PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES MembershipProgram(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_0 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Policy`(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_1 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicySection(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_2 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_3
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PointSystem(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_3 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_RULE AS HAS_RULE_4
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES Rule(node_id)
      LABEL HAS_RULE_4 PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_SECTION
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES PolicyDocument(node_id)
      DESTINATION KEY(target_id) REFERENCES PolicySection(node_id)
      LABEL HAS_SECTION PROPERTIES(
        edge_id,
        source_id,
        target_id),

    HAS_SUB_PROCESS
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES BusinessProcess(node_id)
      LABEL HAS_SUB_PROCESS PROPERTIES(
        condition,
        edge_id,
        source_id,
        target_id),

    HAS_TIER
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES MembershipProgram(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipTier(node_id)
      LABEL HAS_TIER PROPERTIES(
        edge_id,
        source_id,
        target_id),

    INCLUDES
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES BusinessProcess(node_id)
      LABEL INCLUDES PROPERTIES(
        edge_id,
        source_id,
        target_id),

    INITIATES
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Actor(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL INITIATES PROPERTIES(
        action,
        edge_id,
        source_id,
        target_id),

    IS_RESPONSIBLE_FOR
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Department(node_id)
      DESTINATION KEY(target_id) REFERENCES Document(node_id)
      LABEL IS_RESPONSIBLE_FOR PROPERTIES(
        edge_id,
        source_id,
        target_id),

    PERFORMS
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES System(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL PERFORMS PROPERTIES(
        action,
        edge_id,
        source_id,
        target_id),

    PRECEDES
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES ProcessStep(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL PRECEDES PROPERTIES(
        edge_id,
        source_id,
        target_id),

    RELATED_TO AS RELATED_TO_0
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES PaymentMethod(node_id)
      LABEL RELATED_TO_0 PROPERTIES(
        detail,
        edge_id,
        refund_period,
        source_id,
        target_id),

    RELATED_TO AS RELATED_TO_1
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES PointSystem(node_id)
      LABEL RELATED_TO_1 PROPERTIES(
        detail,
        edge_id,
        refund_period,
        source_id,
        target_id),

    RELATED_TO AS RELATED_TO_2
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Rule(node_id)
      DESTINATION KEY(target_id) REFERENCES MembershipProgram(node_id)
      LABEL RELATED_TO_2 PROPERTIES(
        detail,
        edge_id,
        refund_period,
        source_id,
        target_id),

    STARTS_WITH
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES BusinessProcess(node_id)
      DESTINATION KEY(target_id) REFERENCES ProcessStep(node_id)
      LABEL STARTS_WITH PROPERTIES(
        edge_id,
        source_id,
        target_id)
  );

