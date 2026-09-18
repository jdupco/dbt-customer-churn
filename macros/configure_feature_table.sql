{% macro configure_feature_table() %}

    {% set table_name = target.catalog ~ '.ml.customer_churn_features' %}

    {% set check_constraint_query %}
        SELECT COUNT(*) AS constraint_count
        FROM system.information_schema.table_constraints
        WHERE table_catalog = '{{ target.catalog }}'
          AND table_schema = 'ml'
          AND table_name = 'customer_churn_features'
          AND constraint_name = 'customer_churn_features_pk'
    {% endset %}

    {% set results = run_query(check_constraint_query) %}

    {% if execute %}
        {% set constraint_count = results.columns[0].values()[0] %}
    {% else %}
        {% set constraint_count = 0 %}
    {% endif %}

    {% if constraint_count == 0 %}

        {% do run_query(
            "ALTER TABLE " ~ table_name ~
            " ALTER COLUMN customer_id SET NOT NULL"
        ) %}

        {% do run_query(
            "ALTER TABLE " ~ table_name ~
            " ADD CONSTRAINT customer_churn_features_pk " ~
            "PRIMARY KEY (customer_id)"
        ) %}

        {{ log("Primary key created on " ~ table_name, info=True) }}

    {% else %}

        {{ log("Primary key already exists on " ~ table_name, info=True) }}

    {% endif %}

{% endmacro %}