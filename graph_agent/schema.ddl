CREATE TABLE Customer (
  node_id STRING(36) NOT NULL,
  abusePolicy STRING(MAX),
  abusiveBehaviorTypes STRING(MAX),
  benefits STRING(MAX),
  customerId STRING(MAX),
  description STRING(MAX),
  docid STRING(MAX),
  loyaltyProgram STRING(MAX),
  loyaltyTiers STRING(MAX),
  membershipBenefits STRING(MAX),
  membershipLevel STRING(MAX),
  membershipTiers STRING(MAX),
  name STRING(MAX),
  pointSystem STRING(MAX),
  qualification_criteria STRING(MAX),
  source_block STRING(MAX),
  source_block_id STRING(MAX),
  source_doc STRING(MAX),
  source_docid STRING(MAX),
  source_document STRING(MAX),
  source_text STRING(MAX),
  source_text_block_ids STRING(MAX),
  tier STRING(MAX),
  type STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Delivery (
  node_id STRING(36) NOT NULL,
  RTS_Process STRING(MAX),
  deliveryId STRING(MAX),
  description STRING(MAX),
  docid STRING(MAX),
  globalDeliveryPolicy STRING(MAX),
  globalShippingTerm STRING(MAX),
  internationalShippingPolicy STRING(MAX),
  international_return_policy STRING(MAX),
  localAbandonmentRule STRING(MAX),
  name STRING(MAX),
  return_inspection_period STRING(MAX),
  return_shipping_fee_company_fault STRING(MAX),
  return_shipping_fee_customer_fault STRING(MAX),
  riskFactor STRING(MAX),
  rtsProcess STRING(MAX),
  shippingFeePolicy STRING(MAX),
  source_block STRING(MAX),
  source_block_id STRING(MAX),
  source_doc STRING(MAX),
  source_docid STRING(MAX),
  source_document STRING(MAX),
  source_text STRING(MAX),
  source_text_block_ids STRING(MAX),
  status STRING(MAX),
  type STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE `Order` (
  node_id STRING(36) NOT NULL,
  cancellationPolicy STRING(MAX),
  description STRING(MAX),
  docid STRING(MAX),
  exceptionTypes STRING(MAX),
  exchangePolicy STRING(MAX),
  exchange_policy STRING(MAX),
  globalExchangePolicy STRING(MAX),
  globalOrderPolicy STRING(MAX),
  name STRING(MAX),
  orderConfirmationCondition STRING(MAX),
  orderConfirmationDefinition STRING(MAX),
  orderId STRING(MAX),
  partialReturnLogic STRING(MAX),
  returnPolicy STRING(MAX),
  return_policy_change_of_mind STRING(MAX),
  return_policy_defective_item STRING(MAX),
  source_block STRING(MAX),
  source_block_id STRING(MAX),
  source_doc STRING(MAX),
  source_docid STRING(MAX),
  source_document STRING(MAX),
  source_text STRING(MAX),
  source_text_block_ids STRING(MAX),
  status STRING(MAX),
  statusFlow STRING(MAX),
  statusHistory STRING(MAX),
  status_logic STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Payment (
  node_id STRING(36) NOT NULL,
  description STRING(MAX),
  discountAmount STRING(MAX),
  docid STRING(MAX),
  finalBilledAmount STRING(MAX),
  globalPaymentRules STRING(MAX),
  globalRefundPolicy STRING(MAX),
  name STRING(MAX),
  partialReturnLogic STRING(MAX),
  paymentId STRING(MAX),
  paymentMethods STRING(MAX),
  refundDeductionRule STRING(MAX),
  refundRule STRING(MAX),
  refundTimeline STRING(MAX),
  refund_method_credit_card STRING(MAX),
  refund_method_points STRING(MAX),
  refund_method_simple_payment STRING(MAX),
  source_block STRING(MAX),
  source_block_id STRING(MAX),
  source_doc STRING(MAX),
  source_docid STRING(MAX),
  source_document STRING(MAX),
  source_text STRING(MAX),
  source_text_block_ids STRING(MAX),
  status STRING(MAX),
  totalAmount STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE Product (
  node_id STRING(36) NOT NULL,
  categories STRING(MAX),
  category STRING(MAX),
  categorySpecificRules STRING(MAX),
  description STRING(MAX),
  docid STRING(MAX),
  exchangePolicy STRING(MAX),
  name STRING(MAX),
  nonReturnableItems STRING(MAX),
  price STRING(MAX),
  productId STRING(MAX),
  returnInspectionGuideline STRING(MAX),
  returnInspectionGuidelines STRING(MAX),
  returnRestrictionGeneral STRING(MAX),
  return_condition STRING(MAX),
  source_block STRING(MAX),
  source_block_id STRING(MAX),
  source_doc STRING(MAX),
  source_docid STRING(MAX),
  source_document STRING(MAX),
  source_text STRING(MAX),
  source_text_block_ids STRING(MAX),
) PRIMARY KEY(node_id);

CREATE TABLE `contains` (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  businessContext STRING(MAX),
  business_rule STRING(MAX),
  cardinality STRING(MAX),
  context STRING(MAX),
  quantity STRING(MAX),
  rule STRING(MAX),
  source_block_id STRING(MAX),
  source_text STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE distribution_centers (
  id INT64,
  name STRING(MAX),
  latitude FLOAT64,
  longitude FLOAT64,
  distribution_center_geom STRING(MAX),
) PRIMARY KEY(id);

CREATE TABLE events (
  id INT64,
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

CREATE TABLE fulfills (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  businessContext STRING(MAX),
  business_rule STRING(MAX),
  cardinality STRING(MAX),
  context STRING(MAX),
  rule STRING(MAX),
  source_block_id STRING(MAX),
  source_text STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE inventory_items (
  id INT64,
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
  id INT64,
  order_id INT64,
  user_id INT64,
  product_id INT64,
  inventory_item_id INT64,
  status STRING(MAX),
  created_at TIMESTAMP,
  shipped_at TIMESTAMP,
  delivered_at TIMESTAMP,
  returned_at TIMESTAMP,
  sale_price FLOAT64,
) PRIMARY KEY(id);

CREATE TABLE orders (
  order_id INT64,
  user_id INT64,
  status STRING(MAX),
  gender STRING(MAX),
  created_at TIMESTAMP,
  returned_at TIMESTAMP,
  shipped_at TIMESTAMP,
  delivered_at TIMESTAMP,
  num_of_item STRING(MAX),
) PRIMARY KEY(order_id);

CREATE TABLE places (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  applied_benefit STRING(MAX),
  businessContext STRING(MAX),
  business_rule STRING(MAX),
  cardinality STRING(MAX),
  context STRING(MAX),
  source_block_id STRING(MAX),
  source_text STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE products (
  id INT64,
  cost FLOAT64,
  category STRING(MAX),
  name STRING(MAX),
  brand STRING(MAX),
  retail_price FLOAT64,
  department STRING(MAX),
  sku STRING(MAX),
  distribution_center_id INT64,
) PRIMARY KEY(id);

CREATE TABLE settles (
  edge_id STRING(36) NOT NULL,
  source_id STRING(36) NOT NULL,
  target_id STRING(36) NOT NULL,
  businessContext STRING(MAX),
  business_rule STRING(MAX),
  cardinality STRING(MAX),
  context STRING(MAX),
  rule STRING(MAX),
  source_block_id STRING(MAX),
  source_text STRING(MAX),
) PRIMARY KEY(edge_id);

CREATE TABLE users (
  id INT64,
  first_name STRING(MAX),
  last_name STRING(MAX),
  email STRING(MAX),
  age INT64,
  gender STRING(MAX),
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
    Customer
      KEY(node_id)
      LABEL Customer PROPERTIES(
        abusePolicy,
        abusiveBehaviorTypes,
        benefits,
        customerId,
        description,
        docid,
        loyaltyProgram,
        loyaltyTiers,
        membershipBenefits,
        membershipLevel,
        membershipTiers,
        name,
        node_id,
        pointSystem,
        qualification_criteria,
        source_block,
        source_block_id,
        source_doc,
        source_docid,
        source_document,
        source_text,
        source_text_block_ids,
        tier,
        type),

    Delivery
      KEY(node_id)
      LABEL Delivery PROPERTIES(
        deliveryId,
        description,
        docid,
        globalDeliveryPolicy,
        globalShippingTerm,
        international_return_policy,
        internationalShippingPolicy,
        localAbandonmentRule,
        name,
        node_id,
        return_inspection_period,
        return_shipping_fee_company_fault,
        return_shipping_fee_customer_fault,
        riskFactor,
        RTS_Process,
        rtsProcess,
        shippingFeePolicy,
        source_block,
        source_block_id,
        source_doc,
        source_docid,
        source_document,
        source_text,
        source_text_block_ids,
        status,
        type),

    `Order`
      KEY(node_id)
      LABEL `Order` PROPERTIES(
        cancellationPolicy,
        description,
        docid,
        exceptionTypes,
        exchange_policy,
        exchangePolicy,
        globalExchangePolicy,
        globalOrderPolicy,
        name,
        node_id,
        orderConfirmationCondition,
        orderConfirmationDefinition,
        orderId,
        partialReturnLogic,
        return_policy_change_of_mind,
        return_policy_defective_item,
        returnPolicy,
        source_block,
        source_block_id,
        source_doc,
        source_docid,
        source_document,
        source_text,
        source_text_block_ids,
        status,
        status_logic,
        statusFlow,
        statusHistory),

    Payment
      KEY(node_id)
      LABEL Payment PROPERTIES(
        description,
        discountAmount,
        docid,
        finalBilledAmount,
        globalPaymentRules,
        globalRefundPolicy,
        name,
        node_id,
        partialReturnLogic,
        paymentId,
        paymentMethods,
        refund_method_credit_card,
        refund_method_points,
        refund_method_simple_payment,
        refundDeductionRule,
        refundRule,
        refundTimeline,
        source_block,
        source_block_id,
        source_doc,
        source_docid,
        source_document,
        source_text,
        source_text_block_ids,
        status,
        totalAmount),

    Product
      KEY(node_id)
      LABEL Product PROPERTIES(
        categories,
        category,
        categorySpecificRules,
        description,
        docid,
        exchangePolicy,
        name,
        node_id,
        nonReturnableItems,
        price,
        productId,
        return_condition,
        returnInspectionGuideline,
        returnInspectionGuidelines,
        returnRestrictionGeneral,
        source_block,
        source_block_id,
        source_doc,
        source_docid,
        source_document,
        source_text,
        source_text_block_ids)
  )
  EDGE TABLES(
    `contains`
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES `Order`(node_id)
      DESTINATION KEY(target_id) REFERENCES Product(node_id)
      LABEL `contains` PROPERTIES(
        business_rule,
        businessContext,
        cardinality,
        context,
        edge_id,
        quantity,
        rule,
        source_block_id,
        source_id,
        source_text,
        target_id),

    fulfills
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Delivery(node_id)
      DESTINATION KEY(target_id) REFERENCES `Order`(node_id)
      LABEL fulfills PROPERTIES(
        business_rule,
        businessContext,
        cardinality,
        context,
        edge_id,
        rule,
        source_block_id,
        source_id,
        source_text,
        target_id),

    places
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Customer(node_id)
      DESTINATION KEY(target_id) REFERENCES `Order`(node_id)
      LABEL places PROPERTIES(
        applied_benefit,
        business_rule,
        businessContext,
        cardinality,
        context,
        edge_id,
        source_block_id,
        source_id,
        source_text,
        target_id),

    settles
      KEY(edge_id)
      SOURCE KEY(source_id) REFERENCES Payment(node_id)
      DESTINATION KEY(target_id) REFERENCES `Order`(node_id)
      LABEL settles PROPERTIES(
        business_rule,
        businessContext,
        cardinality,
        context,
        edge_id,
        rule,
        source_block_id,
        source_id,
        source_text,
        target_id)
  );

