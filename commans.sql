-- Update Column 
UPDATE televisa_regional.channels
SET region_id = 1
LIMIT 1000;

-- Add forenign key table
ALTER TABLE televisa_regional.channels 
ADD CONSTRAINT regions_region_id_foreign
FOREIGN KEY ( region_id ) REFERENCES regions( id );